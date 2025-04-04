document.addEventListener("DOMContentLoaded", () => {
    if (window.location.pathname.endsWith("index.html") || window.location.pathname === "/minecraft-datapack/") {
        const recipes = [
            "data/mypack/recipe/ocean_sediment.json",
            "data/mypack/recipe/fire.json",
            "data/mypack/recipe/sediment_chunk.json"
        ];
        const container = document.getElementById("recipe-container");

        recipes.forEach(url => {
            fetch(url)
                .then(response => response.json())
                .then(recipe => renderRecipe(recipe, container))
                .catch(error => console.error(`Error loading ${url}:`, error));
        });
    }
});

function renderRecipe(recipe, container) {
    const div = document.createElement("div");
    div.className = "recipe";

    const title = document.createElement("h2");
    title.textContent = recipe.result.components["minecraft:custom_name"].text;
    div.appendChild(title);

    const grid = document.createElement("div");
    grid.className = "grid";

    const pattern = recipe.pattern.concat(Array(3).fill("   ")).slice(0, 3);
    const flatPattern = pattern.map(row => row.padEnd(3, " ").split("")).flat();

    flatPattern.forEach(symbol => {
        const slot = document.createElement("div");
        slot.className = "slot";

        if (symbol !== " ") {
            const item = recipe.key[symbol];
            let linkUrl = "";
            let displayContent = "";

            if (typeof item === "string") {
                if (item.startsWith("#mypack:")) {
                    const tagName = item.replace("#mypack:", "");
                    linkUrl = `recipe.html?recipe=${tagName}`;
                    displayContent = `<img src="assets/minecraft/textures/item/${tagName}.png" alt="${tagName}">`;
                } else {
                    const itemName = item.split(":")[1];
                    linkUrl = `recipe.html?recipe=${itemName}`;
                    displayContent = `<img src="assets/minecraft/textures/item/${itemName}.png" alt="${itemName}">`;
                }
            }

            const link = document.createElement("a");
            link.href = linkUrl;
            link.innerHTML = displayContent || symbol;
            slot.appendChild(link);
        }
        grid.appendChild(slot);
    });

    div.appendChild(grid);

    const output = document.createElement("div");
    output.className = "output";
    const outputImg = document.createElement("img");
    outputImg.src = `assets/minecraft/textures/item/${recipe.result.id.split(":")[1]}.png`;
    outputImg.alt = recipe.result.components["minecraft:custom_name"].text;
    output.appendChild(outputImg);
    output.append(` x${recipe.result.count}`);
    div.appendChild(output);

    container.appendChild(div);
}