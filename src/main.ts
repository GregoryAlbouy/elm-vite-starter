import { Elm } from "./elm/src/Main.elm";
import "./style.css";

function initElm() {
  const root = document.getElementById("app");
  if (!root) throw new Error("Root element #app not found");

  const app = Elm.Main.init({
    node: root,
    flags: {
      env: process.env.NODE_ENV,
    },
  });

  app.ports.log.subscribe(console.log);
}

initElm();
