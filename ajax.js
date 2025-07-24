const sendAjaxRequest=(method, url,async, handler)=>{
    let request=new XMLHttpRequest();
    request.open(method,url,async);
    request.addEventListener('readystatechange',()=>{
        if(request.readyState==4 && request.status==200){
            handler(request);
        }
    })

    request.send();
}