type EventCallback<T = any> = (payload: T) => void;

class EventBus {
  private listeners: Record<string, EventCallback[]> = {};

  on<T = any>(eventName: string, callback: EventCallback<T>): () => void {
    if (!this.listeners[eventName]) {
      this.listeners[eventName] = [];
    }
    this.listeners[eventName].push(callback);
    return () => this.off(eventName, callback);
  }

  off<T = any>(eventName: string, callback: EventCallback<T>) {
    const callbacks = this.listeners[eventName];
    if (!callbacks) return;

    this.listeners[eventName] = callbacks.filter((cb) => cb !== callback);
  }

  emit<T = any>(eventName: string, payload: T) {
    const callbacks = this.listeners[eventName];
    if (!callbacks) return;

    for (const cb of callbacks) {
      cb(payload);
    }
  }

  clear() {
    this.listeners = {};
  }
}

export const eventBus = new EventBus();
