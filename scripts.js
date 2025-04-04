document.addEventListener("DOMContentLoaded", () => {
    const container = document.getElementById("recipe-container");
    if (!container) {
        console.error("Recipe container not found!");
        return;
    }

    if (window.location.pathname.endsWith("recipe.html")) {
        const urlParams = new URLSearchParams(window.location.search);
        const recipeName = urlParams.get("recipe");
        if (recipeName) {
            fetch(`data/crafting/recipe/${recipeName}.json`)
                .then(response => {
                    if (!response.ok) throw new Error(`Failed to load data/crafting/recipe/${recipeName}.json: ${response.status}`);
                    return response.json();
                })
                .then(recipe => renderRecipe(recipe, container))
                .catch(error => {
                    console.error("Error loading recipe:", error);
                    const errorDiv = document.createElement("div");
                    errorDiv.className = "error";
                    errorDiv.textContent = `Error loading recipe: ${recipeName}.json - ${error.message}`;
                    container.appendChild(errorDiv);
                });
        }
    }
});

function formatName(name) {
    return name.replace(/_/g, ' ').replace(/\b\w/g, c => c.toUpperCase());
}

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
            let imgSrc = "";
            let altText = "";

            if (typeof item === "string") {
                if (item.startsWith("#crafting:")) {
                    const tagName = item.replace("#crafting:", "");
                    linkUrl = `recipe.html?recipe=${tagName}`;
                    imgSrc = `assets/minecraft/textures/item/${tagName}.png`;
                    altText = formatName(tagName);
                } else {
                    const itemName = item.split(":")[1];
                    linkUrl = "vanilla_items.html";
                    imgSrc = `assets/minecraft/textures/item/${itemName}.png`;
                    altText = formatName(itemName);
                }
            }

            const link = document.createElement("a");
            link.href = linkUrl;
            const img = document.createElement("img");
            img.src = imgSrc;
            img.alt = altText;
            img.title = altText; // Show on hover
            img.onerror = () => { img.replaceWith(document.createTextNode(altText)); }; // Fallback to text if PNG fails
            link.appendChild(img);
            slot.appendChild(link);
        }
        grid.appendChild(slot);
    });

    div.appendChild(grid);

    const output = document.createElement("div");
    output.className = "output";
    const outputImg = document.createElement("img");
    const resultName = recipe.result.components["minecraft:custom_name"].text;
    outputImg.src = `assets/minecraft/textures/item/${recipe.result.id.split(":")[1]}.png`;
    outputImg.alt = resultName;
    outputImg.title = resultName; // Show on hover
    outputImg.onerror = () => { outputImg.replaceWith(document.createTextNode(resultName)); };
    output.appendChild(outputImg);
    output.append(` x${recipe.result.count}`);
    div.appendChild(output);

    container.appendChild(div);
}