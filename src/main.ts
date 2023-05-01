import { Elm } from "./elm/src/HomePage.elm";
import "./style.css";

function initElm() {
  const root = document.getElementById("app");
  if (!root) throw new Error("Root element #app not found");

  Elm.HomePage.init({
    node: document.getElementById("app")!,
  });
}

initElm();
