
let poemContentDivEl;
let poemContent;
let worksDivEl;
let loadButtonEl;

function countWords(){
    const input = document.getElementById('searchcountfield').value;
    const re = new RegExp(input, "gi");
    const poem = poemContent;
    let count = (poem.match(re) || []).length;
    alert('The number of the typed word in the poem is ' + count + '.');
}

function onLoadPoemContent() {
    showContents(["logout-content", "profile-content", "works", 'poemContent'+this.id]);
    poemContent = document.getElementById('poemContent'+this.id).innerHTML;
}

function createWorksList(works) {
    const ulEl = document.createElement('ul');

    for (let i = 0; i < works.length; i++) {
        const work = works[i];

        // creating paragraph
        const strongEl = document.createElement('strong');
        strongEl.classList.add('pointer');

        strongEl.textContent = work.title;
        strongEl.addEventListener("click", onLoadPoemContent);
        strongEl.id = work.id;
        const pEl = document.createElement('p');
        pEl.appendChild(strongEl);
        const poemContent = document.createElement("pre");
        poemContent.innerHTML = work.content;
        poemContent.classList.add('hidden');
        poemContent.classList.add('content');
        poemContent.id = "poemContent" + work.id;


        // creating list item
        const liEl = document.createElement('li');
        liEl.appendChild(pEl);
        liEl.appendChild(poemContent);
        ulEl.appendChild(liEl);
    }
    return ulEl;
}

function onWorksReceived() {
    showContents(['profile-content', 'logout-content', 'works']);

    const text = this.responseText;
    const works = JSON.parse(text);

    const divEl = document.getElementById('works-content');
    while (divEl.firstChild) {
        divEl.removeChild(divEl.firstChild);
    }
    divEl.appendChild(createWorksList(works));
}

function onLoadWorks() {
    const el = this;
    /*const userId = el.getAttribute('data-user-id');*/

    const xhr = new XMLHttpRequest();
    xhr.addEventListener('load', onWorksReceived);
    xhr.open('GET', 'protected/workservlet');
    xhr.send();
}




document.addEventListener('DOMContentLoaded', (event) => {
    poemContentDivEl = document.getElementById('poemcontent');
    worksDivEl = document.getElementById('works');
});
