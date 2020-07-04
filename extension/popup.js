let changeColor = document.getElementById('changeColor');

chrome.storage.sync.get('color', function(data) {
    changeColor.style.backgroundColor = data.color;
    changeColor.setAttribute('value', data.color);
})

changeColor.onclick = function(element) {
    fetch('http://localhost:5000/new_card', {
        method: 'POST',
        cors: 'no-cors',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({content: 'test'})
    })
}