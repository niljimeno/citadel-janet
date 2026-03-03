console.log("Vim keybinds are enabled! Use J and K to move through the results")

let current
let currentId
let searchResults = []

function getSearchResults() {
    return Array.from(
        document.getElementsByClassName("result")
    )
}

function focusCurrent() {
    current = searchResults[currentId]
    current.focus()
}

function move(step) {
    console.log(currentId, currentId == undefined, currentId + step, searchResults.length)

    if (currentId != undefined) {
        let newId = currentId + step
        if (newId >= 0 &&
            newId < searchResults.length) {
                currentId = newId
                focusCurrent()
        }
    } else {
        if (searchResults != undefined &&
            searchResults.length != 0) {
                currentId = 0
                focusCurrent()
        }
    }
}

function moveUp() {
    move(-1)
}

function moveDown() {
    move(1)
}

window.addEventListener('load', (_) => {
    searchResults = getSearchResults()
})

window.addEventListener("keypress", (event) => {
    switch (event.key) {
        case "j":
        moveDown()
        break

        case "k":
        moveUp()
        break
    }
})
