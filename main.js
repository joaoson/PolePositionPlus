import * as THREE from "https://cdn.skypack.dev/three@0.129.0/build/three.module.js";
// To allow for the camera to move around the scene
import { OrbitControls } from "https://cdn.skypack.dev/three@0.129.0/examples/jsm/controls/OrbitControls.js";
// To allow for importing the .gltf file
import { GLTFLoader } from "https://cdn.skypack.dev/three@0.129.0/examples/jsm/loaders/GLTFLoader.js";

//Create a Three.JS Scene
const scene = new THREE.Scene();

//create a new camera with positions and angles
const camera = new THREE.PerspectiveCamera(100, window.innerWidth / window.innerHeight, 0.1, 70);

//Keep track of the mouse position, so we can make the eye move
let mouseX = window.innerWidth / 2;
let mouseY = window.innerHeight / 2;

//Keep the 3D object on a global variable so we can access it later
let object = new THREE.Object3D();

//OrbitControls allow the camera to move around the scene
let controls;
let scrolly = 0;

//Set which object to render

//Instantiate a loader for the .gltf file
const loader = new GLTFLoader();

//Load the file
loader.load(
  `./41-formula-1/scene.gltf`,
  //`./formula_1_car_midpoly/scene.gltf`,

  function (gltf) {
    //If the file is loaded, add it to the scene
    object = gltf.scene;
    scene.add(object);
  },
  function (xhr) {
    //While it is loading, log the progress
    console.log((xhr.loaded / xhr.total * 100) + '% loaded');
  },
  function (error) {
    //If there is an error, log it
    console.error(error);
  }
);

//Instantiate a new renderer and set its size
const renderer = new THREE.WebGLRenderer({ alpha: true, antialias : true }); //Alpha: true allows for the transparent background
console.log(window.innerWidth)
renderer.setSize(window.innerWidth, window.innerHeight);

//Add the renderer to the DOM
renderer.domElement.setAttribute("id", "objeto");
document.getElementById("container3D").appendChild(renderer.domElement);

//Set how far the camera will be from the 3D model
camera.position.z = 3;

//Add lights to the scene, so we can actually see the 3D model
const topLight = new THREE.DirectionalLight(0xffffff, 1); // (color, intensity)
topLight.position.set(0, 0, 20) //top-left-ish
topLight.castShadow = true;
scene.add(topLight);

const ambientLight = new THREE.AmbientLight(0x222222, 1);
scene.add(ambientLight);

//This adds controls to the camera, so we can rotate / zoom it with the mouse

//controls = new OrbitControls(camera, renderer.domElement);


//renderer.render(scene, camera);


//Render the scene
function animate() {
  requestAnimationFrame(animate);
  //Here we could add some code to update the scene, adding some automatic movement

  //Make the eye move
  //I've played with the constants here until it looked good 
  //object.rotation.y = -3 + mouseX / window.innerWidth * 3;
  //object.rotation.x = -1.2 + mouseY * 2.5 / window.innerHeight;
  if(scrolly<100){
    object.position.y =0;
    object.position.x = 5;
    object.rotation.y = 1.2;
    object.rotation.x = 0;  
    object.rotation.z = 1.5;  
  }
  else if(scrolly<800){
    object.position.y =0;
    object.position.x = (800-scrolly)/140;
    object.rotation.y = (800-scrolly)/583;
    object.rotation.z = (800-scrolly)/466;
  }
  renderer.render(scene, camera);
}

//Add a listener to the window, so we can resize the window and the camera
window.addEventListener("resize", function () {
  camera.aspect = window.innerWidth / window.innerHeight;
  camera.updateProjectionMatrix();
  renderer.setSize(window.innerWidth, window.innerHeight);
});

//add mouse position listener, so we can make the eye move
document.onmousemove = (e) => {
  mouseX = e.clientX;
  mouseY = e.clientY;
}



//Start the 3D rendering
animate();
window.addEventListener('scroll', () => {
  console.log(window.pageYOffset)
  scrolly = window.pageYOffset;
  document.getElementById("objeto").style.top = scrolly;
  if(scrolly>100){
    document.getElementById("arrowIcon").style.opacity = "0";
  }else{
    document.getElementById("arrowIcon").style.opacity = "1";
  }
});

AOS.init();
