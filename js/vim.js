console.log("Vim keybinds are enabled! Use J and K to move through the results")

let current
let currentId
let searchResults = []
let paused = false

let searchBar

function getSearchResults() {
    return Array.from(
        document.getElementsByClassName("result")
    )
}

function focusCurrent() {
    if (currentId == undefined) {
        return
    }

    current = searchResults[currentId]
    current.focus()
}

function unfocus() {
    searchBar.focus()
    searchBar.blur()
    searchBar.blur()
    searchBar.blur()
    searchBar.blur()
}

function move(step) {
    if (document.activeElement == searchBar) {
        return
    }

    if (paused) {
        paused = false
    } else if (currentId != undefined) {
        let newId = currentId + step
        if (newId >= 0 &&
            newId < searchResults.length) {
                currentId = newId
        }
    } else {
        if (searchResults != undefined &&
            searchResults.length != 0) {
                currentId = 0
        }
    }

    focusCurrent()
}

function moveUp() {
    move(-1)
}

function moveDown() {
    move(1)
}

window.addEventListener('load', (_) => {
    searchBar = document.getElementById("search")
    searchResults = getSearchResults()
})

window.addEventListener("keydown", (event) => {
    switch (event.key) {
        case "Escape":
        paused = true
        unfocus()
        break

        case "/":
        event.preventDefault()
        searchBar.focus()
        break

        case "j":
        moveDown()
        break

        case "k":
        moveUp()
        break
    }
})
