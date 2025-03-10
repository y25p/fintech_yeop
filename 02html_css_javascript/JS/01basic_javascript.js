// 웹브라우저 콘솔에 id title을 갖는 태그를 찾아 출력
const title = document.querySelector("#title");
console.log(title);

// 링크 클릭 이벤트 연결하기 //
const link =document.querySelector("a")
// link.addEventListener("click", ()=>{
//    console.log("링크를 클릭했습니다.");});

// 링크를 클릭해도 링크가 작동되지 않고 console.log만 작동되도록 prevent default //
link.addEventListener("click", (e)=>{
    e.preventDefault();
    console.log("링크를 클릭했습니다.");
});


// 마우스 호버 이벤트 - HTML요소에 마우스이벤트 연결하기 //
const box = document.querySelector("#box")
box.addEventListener("mouseenter",()=>{
    box.style.backgroundColor = "hotpink";
});

box.addEventListener("mouseleave", ()=>{
    box.style.backgroundColor = "aqua";
});

// 반복요소에 이벤트 한꺼번에 연결하기 //

const list = document.querySelectorAll(".list li");
console.log(list);
for(let el of list){
    el.addEventListener("click", e=>{
        e.preventDefault()
        console.log(e.currentTarget.innerText);
    });
}
    
// 클릭 이벤트가 발생할 때 숫자 증가, 감소하기 //
const btnPlus = document.querySelector(".btnPlus")
const btnMinus = document.querySelector(".btnMinus")
let num = 0; //제어할 숫자값을0으로 초기화 //

// btnPlus를 클릭할 때
btnPlus.addEventListener("click", e=>{
    e.preventDefault();
    num++; //num값을 1씩 더하는부분
    console.log(num); //btnPlus클릭했을때 
});

// btnMinus 클릭할 때
btnMinus.addEventListener("click", e=>{
    e.preventDefault();
    num--; //num값을 1씩 빼는부분
    console.log(num); //btnPlus클릭했을때 
});


// 버튼을 클릭하면 좌우로 box회전 //
const btnLeft = document.querySelector(".btnLeft");
const btnRight = document.querySelector(".btnRight");
const box2 = document.querySelector("#box2");
const deg = 45; //회전각도 degree 
let num2 = 0; //회전하라고 클릭할 때 클릭수가 더해질 수를 0으로 초기화하도록

//btnLeft를 클릭할 때
btnLeft.addEventListener("click", e=>{
    e.preventDefault();
    num2--;
    console.log(`왼쪽으로 회전시num2안의값: ${num2}`); //백틱 `변수와 변수 안의값` 출력해야할때.
    console.log(num2);
    box2.style.transform = `rotate(${num2 * deg}deg)`
})

//btnRight를 클릭할 때
btnRight.addEventListener("click", e=>{
    e.preventDefault();
    num2++;
    console.log(`오른쪽으로 회전시 num2안의값: ${num2}`); //백틱 `변수와 변수 안의값` 출력해야할때.
    console.log(num2);
    box2.style.transform = `rotate(${num2 * deg}deg)`
})

// 파이썬으로 가면 문자열formating하게 되는데 
// f"num2{num2}" 이게 자바`num2: ${num2}`와 같은기능