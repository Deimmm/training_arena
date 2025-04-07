import { sniper_ai } from "../ai/Sniper";
import { CreepSpawn } from "../units/creeps";

export class Lasthit1V1 {
  private sniper?: CBaseEntity;
  private context: any = {};
  private spawns: CreepSpawn[] = [];
  private listeners: CustomGameEventListenerID[] = [];
  private controller: CDOTAPlayerController;

  public listenEvents() {
    const id = CustomGameEventManager.RegisterListener(
      "game_launch.1v1",
      (userId: number, event: any) => {
        print("game_launch.1v1 EVENT AAA", event.isSniper);
        const playerController = PlayerResource.GetPlayer(event.PlayerID);
        if (playerController) {
          this.controller = playerController;
          this.launch(playerController, event);

          const relaunchId = CustomGameEventManager.RegisterListener(
            "game_relaunch.1v1",
            (userId: number, event: any) => {
              this.reLaunch(playerController, event);
              CustomGameEventManager.Send_ServerToPlayer<any>(
                playerController,
                "game_relaunch.1v1.success",
                { data: null },
              );
            },
          );

          const finishId = CustomGameEventManager.RegisterListener(
            "game_finish.1v1",
            (userId: number, event: any) => {
              this.finish();
              CustomGameEventManager.Send_ServerToPlayer<any>(
                playerController,
                "game_finish.1v1.success",
                { data: null },
              );
            },
          );
          this.listeners.concat([relaunchId, finishId]);
          CustomGameEventManager.Send_ServerToPlayer<any>(
            playerController,
            "game_launch.1v1.success",
            { data: null },
          );
        }
      },
    );
    this.listeners.push(id);
  }

  private reLaunch(controller: CDOTAPlayerController, options: any) {
    this.finish();
    this.launch(controller, options);
  }

  private launch(controller: CDOTAPlayerController, options: any) {
    this.moveHero(controller);
    this.initCreepSpawns();
    if (options.isSniper === 1) {
      this.sniper = this.createSniper();
    }
  }

  private finish() {
    const sniper = this.sniper;
    if (sniper && !sniper.IsNull()) {
      sniper.Destroy();
    }
    const listeners = this.listeners;
    if (listeners.length > 0) {
      listeners.forEach((listener) =>
        CustomGameEventManager.UnregisterListener(listener),
      );
    }
    StopListeningToAllGameEvents(this.context);
    const spawns = this.spawns;
    if (spawns.length > 0) {
      spawns.forEach((spawn) => spawn.stopSpawn());
    }
    const creeps = Entities.FindAllByClassname("npc_dota_creep_lane");
    if (creeps && creeps.length > 0) {
      creeps.forEach((creep) => creep.Destroy());
    }
    this.returnHero();
    this.listenEvents();
  }

  private initCreepSpawns() {
    const padawan_spawn = Entities.FindByName(undefined, "radiant_creep_spawn");
    const sniper_spawn = Entities.FindByName(undefined, "dire_creep_spawn");
    if (!padawan_spawn || !sniper_spawn) {
      print("WARNING: ", "Cant find spawns");
      return;
    }

    const badguys_spawn = new CreepSpawn();
    const goodguys_spawn = new CreepSpawn();
    this.spawns = this.spawns.concat([goodguys_spawn, badguys_spawn]);
    badguys_spawn.startSpawn(
      padawan_spawn.GetAbsOrigin(),
      sniper_spawn.GetAbsOrigin(),
      { melee: 3, range: 1, business: 0 },
      30,
      DotaTeam.GOODGUYS,
    );
    goodguys_spawn.startSpawn(
      sniper_spawn.GetAbsOrigin(),
      padawan_spawn.GetAbsOrigin(),
      { melee: 3, range: 1, business: 0 },
      30,
      DotaTeam.BADGUYS,
    );
  }
  private returnHero() {
    const hero = this.controller.GetAssignedHero();
    const game_start = Entities.FindByName(undefined, "start");
    if (!game_start) {
      return;
    }
    const vector = game_start.GetAbsOrigin();
    hero.SetAbsOrigin(vector);
    CenterCameraOnUnit(this.controller.GetPlayerID(), hero);
  }
  private moveHero(controller: CDOTAPlayerController) {
    const hero = controller.GetAssignedHero();
    const padawan_spawn = Entities.FindByName(undefined, "padawan_spawn");
    if (!padawan_spawn) {
      return;
    }
    const vector = padawan_spawn.GetAbsOrigin();
    hero.SetAbsOrigin(vector);
    CenterCameraOnUnit(controller.GetPlayerID(), hero);
  }
  private createSniper(): CBaseEntity {
    const sniper_spawn = Entities.FindByName(undefined, "sniper_spawn");
    if (!sniper_spawn) {
      return;
    }
    const spawn_vector = sniper_spawn.GetAbsOrigin();
    const sniper_hero = CreateUnitByName(
      "npc_dota_hero_sniper",
      spawn_vector,
      true,
      undefined,
      undefined,
      DotaTeam.BADGUYS,
    );
    ListenToGameEvent(
      "entity_killed",
      (event) => {
        if (this.sniper.IsNull()) {
          return;
        }
        if (event.entindex_attacker === sniper_hero.GetEntityIndex()) {
          const entity = EntIndexToHScript(event.entindex_killed);
          if (entity) {
            const position = entity.GetAbsOrigin();
            const particle = ParticleManager.CreateParticle(
              "particles/msg_fx/msg_death.vpcf",
              8,
              undefined,
            );
            ParticleManager.SetParticleControl(particle, 0, position);
          }
          print(
            "entity_killed ",
            "KILLED BY: ",
            event.entindex_attacker,
            "SNIPERID",
            sniper_hero.GetEntityIndex(),
          );
        }
      },
      this.context,
    );
    sniper_hero.AddNewModifier(undefined, undefined, sniper_ai.name, {
      damage: 62,
      base_attack_time: 1,
    });
    return sniper_hero;
  }
}
