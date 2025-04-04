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
                    errorDiv.className = "error");
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
    console.log("Rendering recipe:", recipe.result.components["minecraft:custom_name"].text);
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
        console.log("Processing symbol:", symbol);
        const slot = document.createElement("div");
        slot.className = "slot";

        if (symbol !== " ") {
            const item = recipe.key[symbol];
            console.log("Item for symbol", symbol, "is:", item);
            let linkUrl = "";
            let imgSrc = "";
            let altText = "";

            if (typeof item === "string") {
                // Handle string-based items (older format)
                if (item.startsWith("#crafting:")) {
                    const tagName = item.replace("#crafting:", "");
                    console.log("Found custom item (string), tagName:", tagName);
                    linkUrl = `recipe.html?recipe=${tagName}`;
                    imgSrc = `assets/minecraft/textures/item/${tagName}.png`;
                    altText = formatName(tagName);
                } else {
                    const itemName = item.split(":")[1];
                    console.log("Found vanilla item (string), itemName:", itemName);
                    linkUrl = "vanilla_items.html";
                    imgSrc = `assets/minecraft/textures/item/${itemName}.png`;
                    altText = formatName(itemName);
                }
            } else if (item && typeof item === "object" && item.id) {
                // Handle object-based items (new format)
                const itemName = item.id.split(":")[1];
                console.log("Found object-based item, itemName:", itemName);
                if (item.components && item.components["minecraft:custom_data"]) {
                    // Custom item with components (e.g., ocean_sediment, fire)
                    const customName = itemName; // Use base ID as key for now; adjust if custom names are provided
                    console.log("Custom item with components, using:", customName);
                    linkUrl = `recipe.html?recipe=${customName}`;
                    imgSrc = `assets/minecraft/textures/item/${customName}.png`;
                    altText = formatName(customName);
                } else {
                    // Vanilla item without custom components
                    console.log("Vanilla item without components, itemName:", itemName);
                    linkUrl = "vanilla_items.html";
                    imgSrc = `assets/minecraft/textures/item/${itemName}.png`;
                    altText = formatName(itemName);
                }
            } else {
                console.error("Unexpected item type for symbol", symbol, item);
            }

            const link = document.createElement("a");
            link.href = linkUrl || "#";
            const img = document.createElement("img");
            img.src = imgSrc;
            img.alt = altText;
            img.title = altText;
            img.onerror = () => { 
                console.error("Failed to load image for", altText, "at", imgSrc);
                img.replaceWith(document.createTextNode(altText)); 
            };
            link.appendChild(img);
            slot.appendChild(link);
        } else {
            console.log("Empty slot for symbol:", symbol);
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
    outputImg.title = resultName;
    outputImg.onerror = () => { outputImg.replaceWith(document.createTextNode(resultName)); };
    output.appendChild(outputImg);
    output.append(` x${recipe.result.count}`);
    div.appendChild(output);

    container.appendChild(div);
}
