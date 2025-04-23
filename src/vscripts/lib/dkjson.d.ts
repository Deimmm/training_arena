declare module "lib.dkjson" {
  /** Version string, e.g. "dkjson 2.8" */
  export const version: string;

  /** Quote and escape a Lua string as JSON-safe */
  export function quotestring(value: string): string;

  /** Encode a Lua table (represented as object) to JSON string */
  export function encode(
    value: any,
    state?: {
      indent?: boolean | string;
      level?: number;
      buffer?: string[];
      bufferlen?: number;
      tables?: Record<any, boolean>;
      keyorder?: string[];
      exception?: (
        reason: string,
        value: any,
        state: any,
        message: string,
      ) => [boolean, string?];
    },
  ): string;

  /** Decode JSON string to Lua table (object/array) */
  export function decode(
    json: string,
    pos?: number,
    nullValue?: any,
    objectMeta?: any,
    arrayMeta?: any,
  ): [any, number?];

  /** Add a newline to a buffer in a formatted state */
  export function addnewline(state: {
    indent?: boolean | string;
    level?: number;
    buffer: string[];
    bufferlen?: number;
  }): void;

  /** Default handler for encode errors (e.g. cycles) */
  export function encodeexception(
    reason: string,
    value: any,
    state: any,
    defaultmessage?: string,
  ): string;

  /** Enable LPeg-based decoder (if available) */
  export function use_lpeg(): typeof import("lib.dkjson");
}
