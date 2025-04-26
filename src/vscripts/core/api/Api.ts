import { CommonAimUpdateDTO } from "./dto/common-aim.dto";
export class API {
  constructor() {}
  listenEvents() {
    DeepPrintTable(CustomGameEventManager);
    CustomGameEventManager.RegisterListener(
      "aim_common.table.get",
      async (event: any) => {
        print("[SERVER] aim_common.table.get");
        API.getCommonAim();
      },
    );
  }
  public static updateCommonAim(input: CommonAimUpdateDTO) {
    const request = CreateHTTPRequest(
      "POST",
      "http://localhost:3000/common-aim",
    );
    request.SetHTTPRequestRawPostBody("application/json", json.encode(input));
    request.Send((res) => {
      if (res.StatusCode < 200 || res.StatusCode > 299) {
        print("SUPER HTTP ERROR: ", res.StatusCode, res.Body);
      } else {
        print("HTTP SUCCESS");
      }
    });
  }
  public static async getCommonAim() {
    const request = CreateHTTPRequest(
      "GET",
      "http://localhost:3000/common-aim",
    );

    request.Send((res) => {
      if (res.StatusCode < 200 || res.StatusCode > 299) {
        print("HTTP ERROR: ", res.StatusCode, res.Body);
      } else {
        print("HTTP SUCCESS", res.Body);
        const body = json.decode(res.Body)[0];
        DeepPrintTable(body);
        CustomNetTables.SetTableValue(
          //@ts-ignore
          "common-aim",
          "table",
          body,
        );
        CustomGameEventManager.Send_ServerToAllClients<any>(
          "aim_common.table.get.response",
          { good: true },
        );
      }
    });
  }
}
