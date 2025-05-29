
/*
 * webapp.js
 * Rui, Raquel 
 * 20 May, 2025
 * based on books.js by Jeff Ondich
 */

window.addEventListener("load", initialize)
function initialize(){
  var element = document.getElementById("get-characters");
  element.onclick = loadCharacters;
}

function getAPIBaseURL() {
  var baseURL = window.location.protocol + '//' + window.location.hostname + ':' + window.location.port + '/api';
  return baseURL;
}
window.addEventListener("load", initialize);

function initialize() {
  // load all three lists right away
  loadList("potions");
  loadList("characters");
  loadList("spells");
}

function getAPIBaseURL() {
  return (
    window.location.protocol +
    "//" +
    window.location.hostname +
    ":" +
    window.location.port +
    "/api"
  );
}

/**
 * type: one of "potions" | "characters" | "spells"
 */
function loadList(type) {
  const endpoint = `${getAPIBaseURL()}/${type}?limit=200`;
  const listId =
    type === "characters"
      ? "character-list"
      : type === "potions"
      ? "potion-list"
      : "spell-list";
  const ul = document.getElementById(listId);
  const container = document.getElementById(`${type}-content`);
  const img = container.querySelector("img.content-cover");

  // show loading placeholder
  ul.innerHTML = "<li>Loading…</li>";
  img.style.opacity = 0.2;

  fetch(endpoint)
    .then((res) => res.json())
    .then((items) => {
      // clear placeholder
      ul.innerHTML = "";

      // sort alphabetically
      items.sort((a, b) => a.name.localeCompare(b.name));

      items.forEach((item) => {
        const li = document.createElement("li");
        const a = document.createElement("a");
        a.textContent = item.name;
        // link to detail page (you'll create these next)
        a.href = `/${type.slice(0, -1)}.html?id=${item.id}`;
        li.appendChild(a);
        ul.appendChild(li);
      });

      // restore image opacity
      img.style.opacity = 0.9;
    })
    .catch((err) => {
      ul.innerHTML = "<li class='error'>Failed to load.</li>";
      console.error(err);
    });
}