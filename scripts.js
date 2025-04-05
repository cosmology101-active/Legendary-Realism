document.addEventListener("DOMContentLoaded", () => {
    const recipeContainer = document.getElementById("recipe-container");
    const recipeList = document.getElementById("recipe-list");

    // Handle recipe.html
    if (recipeContainer && window.location.pathname.endsWith("recipe.html")) {
        if (recipeContainer.dataset.rendered) {
            console.log("Recipe already rendered, skipping...");
            return;
        }

        const urlParams = new URLSearchParams(window.location.search);
        const recipeName = urlParams.get("recipe");
        if (recipeName) {
            fetch(`data/crafting/recipe/${recipeName}.json`)
                .then(response => {
                    if (!response.ok) throw new Error(`Failed to load data/crafting/recipe/${recipeName}.json: ${response.status}`);
                    return response.json();
                })
                .then(recipe => {
                    renderRecipe(recipe, recipeContainer, recipeName);
                    recipeContainer.dataset.rendered = "true";
                })
                .catch(error => {
                    console.error("Error loading recipe:", error);
                    const errorDiv = document.createElement("div");
                    errorDiv.className = "error";
                    errorDiv.textContent = `Error loading recipe: ${recipeName}.json - ${error.message}`;
                    recipeContainer.appendChild(errorDiv);
                });
        }
    }

    // Handle items.html
    if (recipeList && window.location.pathname.endsWith("items.html")) {
        fetchRecipesFromGitHub();
    }
});

function formatName(name) {
    return name.replace(/_/g, ' ').replace(/\b\w/g, c => c.toUpperCase());
}

function renderRecipe(recipe, container, recipeName) {
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
                if (item.startsWith("#crafting:")) {
                    const tagName = item.replace("#crafting:", "");
                    console.log("Found custom item (tag), tagName:", tagName);
                    linkUrl = `recipe.html?recipe=${tagName}`;
                    imgSrc = `assets/minecraft/textures/item/${tagName}.png`;
                    altText = formatName(tagName);
                } else {
                    const itemName = item.split(":")[1];
                    console.log("Found vanilla item, itemName:", itemName);
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
    const outputImgName = recipeName;
    outputImg.src = `assets/minecraft/textures/item/${outputImgName}.png`;
    outputImg.alt = resultName;
    outputImg.title = resultName;
    outputImg.onerror = () => { 
        console.error("Failed to load output image for", resultName, "at", outputImg.src);
        outputImg.replaceWith(document.createTextNode(resultName)); 
    };
    output.appendChild(outputImg);
    output.append(` x${recipe.result.count}`);
    div.appendChild(output);

    container.appendChild(div);
}

function fetchRecipesFromGitHub() {
    const repoUrl = "https://api.github.com/repos/cosmology101-active/Legendary-Realism/contents/data/crafting/recipe";
    fetch(repoUrl)
        .then(response => {
            if (!response.ok) throw new Error(`Failed to fetch repo contents: ${response.status}`);
            return response.json();
        })
        .then(files => {
            const recipeList = document.getElementById("recipe-list");
            files
                .filter(file => file.name.endsWith(".json"))
                .forEach(file => {
                    const recipeName = file.name.replace(".json", "");
                    fetch(file.download_url)
                        .then(response => response.json())
                        .then(recipe => {
                            const li = document.createElement("li");
                            const a = document.createElement("a");
                            a.href = `recipe.html?recipe=${recipeName}`;
                            a.textContent = recipe.result.components["minecraft:custom_name"].text;
                            li.appendChild(a);
                            recipeList.appendChild(li);
                        })
                        .catch(error => console.error(`Error loading ${recipeName}:`, error));
                });
        })
        .catch(error => {
            console.error("Error fetching recipes from GitHub:", error);
            const errorLi = document.createElement("li");
            errorLi.textContent = "Failed to load recipes. Please try again later.";
            recipeList.appendChild(errorLi);
        });
}
