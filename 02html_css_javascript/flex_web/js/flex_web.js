// 모든 aritcle 요소들을 변수 items에 저장 //
const items =document.querySelectorAll("article");
// console.log(items);
const aside = document.querySelector("aside");
//
const close = aside.querySelector("span");
//console.log(close);

//items를 반복문으로 돌리기
for(let el of items) {
    // 현재 반복이 돌고 있는 article 요소에 mouseenter 이벤트 발생시
    el.addEventListener("mouseenter", e=>{
        // 자식인 video 재생
        e.currentTarget.querySelector("video").play();
    });    

    // 현재 반복이 돌고있는 aritcle 요소에 mouseleave이벤트 발생시
    el.addEventListener("mouseleave", e=>{
        // 자식인 video요소 일시중지
        e.currentTarget.querySelector("video").pause();
    });

    // article 요소에 click발생시
    el.addEventListener("click",e=>{
        // 제목과 본문의 내용 그리고 video 요소의 src값을 변수에 저장하게 아래 내용.
        let tit = e.currentTarget.querySelector("h2").innerText;
        let txt = e.currentTarget.querySelector("p").innerText;
        let vidSrc = e.currentTarget.querySelector("video").getAttribute("src");
        // vidSrc는 경로 저장할 변수인것        
        console.log(`title: ${tit}, p의내용: ${txt}, video경로: ${vidSrc}`);

        // aside 안쪽 콘텐츠에 위 변수 내용을 적용
        aside.querySelector("h1").innerText = tit;
        aside.querySelector("p").innerText = txt;
        aside.querySelector("video").setAttribute("src", vidSrc);

        // aside 요소 안의 동영상을 재생하고 class=on
        aside.querySelector("video").play();
        aside.classList.add("on");

    })

    // close 버튼 누르면
    close.addEventListener("click", ()=>{
        // aside 요소에서 클래스 on제거하여 비활성화한 후 영상재생을 일시정지
        aside.classList.remove("on");
        aside.querySelector("video").pause();
    })
    

}    