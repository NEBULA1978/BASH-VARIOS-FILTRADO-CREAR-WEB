// Seleccoionamos por id caja imagenes
var photoContainer = document.getElementById("photo-container");

// Abrimos div
content = '<div class="column">';
for(let i=0; i< 20; i++){
    // Creamos 4 columnas div con 5fotos
    if(i!=0 && (i % 5 == 0)){
        content += `
        // Añadimos columna nueva
        </div><div class="column">
        ${getPhotoElement(i+1)}`;
    }else{
        content += getPhotoElement(i+1);
    }
}
// Cerramos div content
content += "</div>";
// console.log(content)


// Para ver foto 1
// photoContainer.innerHTML = getPhotoElement(1);
// Para ver foto 2
// photoContainer.innerHTML = getPhotoElement(2);

// Para añdir foto 1
// photoContainer.innerHTML += getPhotoElement(1);
// Para añdir foto 2
// photoContainer.innerHTML += getPhotoElement(2);
// Veria dos fotos


// Añadir 20 fotos con un bucle for con inneHTML
// for(let i=0; i< 20; i++){
//     photoContainer.innerHTML += getPhotoElement(i+1);
// }

photoContainer.innerHTML = content;
// Crear nombre fotos por id
function getPhotoElement(photo_id){
    return `<a href="#" class="photo">
        <img loading="lazy" alt="Photo ${photo_id}" src="img/photo_${photo_id}.jpg" />
    </a>`;
}