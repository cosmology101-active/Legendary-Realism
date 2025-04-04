document.addEventListener("DOMContentLoaded", () => {
    if (window.location.pathname.endsWith("index.html") || window.location.pathname === "/Legendary-Realism/") {
        const recipes = [
            "data/crafting/recipe/ocean_sediment.json",
            "data/crafting/recipe/fire.json",
            "data/crafting/recipe/sediment_chunk.json"
        ];
        const container = document.getElementById("recipe-container");

        recipes.forEach(url => {
            fetch(url)
                .then(response => {
                    if (!response.ok) throw new Error(`Failed to load ${url}: ${response.status}`);
                    return response.json();
                })
                .then(recipe => renderRecipe(recipe, container))
                .catch(error => {
                    console.error(`Error loading ${url}:`, error);
                    const errorDiv = document.createElement("div");
                    errorDiv.className = "error";
                    errorDiv.textContent = `Error loading recipe: ${url.split("/").pop()} - Check console for details.`;
                    container.appendChild(errorDiv);
                });
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
            let displayText = "";

            if (typeof item === "string") {
                if (item.startsWith("#crafting:")) {
                    const tagName = item.replace("#crafting:", "");
                    linkUrl = `recipe.html?recipe=${tagName}`;
                    displayText = tagName;
                } else {
                    const itemName = item.split(":")[1];
                    linkUrl = `recipe.html?recipe=${itemName}`;
                    displayText = itemName;
                }
            }

            const link = document.createElement("a");
            link.href = linkUrl;
            link.textContent = displayText || symbol;
            slot.appendChild(link);
        }
        grid.appendChild(slot);
    });

    div.appendChild(grid);

    const output = document.createElement("div");
    output.className = "output";
    output.textContent = `${recipe.result.components["minecraft:custom_name"].text} x${recipe.result.count}`;
    div.appendChild(output);

    container.appendChild(div);
}