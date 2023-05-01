declare module "*.elm" {
  export const Elm: {
    Main: ElmMain<{
      // logs input to the console
      log: PortFromElm<unknown>;
    }>;
  };
}
