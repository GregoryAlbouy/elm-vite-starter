declare module "*.elm" {
  export const Elm: {
    HomePage: ElmMain<{
      // logs input to the console
      log: PortFromElm<unknown>;
    }>;
  };
}
