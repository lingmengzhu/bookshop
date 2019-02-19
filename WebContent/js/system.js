
      		var jiaArr = ["请选择","教育", "小说", "文艺","社科","生活","儿童","励志"];
            var exampleArr = [
                    ["请选择"],
                    ["语文", "英语", "物理","数学","化学","政治","地理"],
                    ["玄幻", "言情", "推理","恐怖","悬疑","武侠","科幻"],
                    ["文学", "传记", "历史","艺术","摄影","科学","天文"],
                    ["法律", "军事", "心理","古籍","哲学","文化","民族"],
                    ["亲子", "运动", "美妆","休闲","家居","风水","美食"],
                    ["科普", "幼儿", "少儿","成长","绘本","工具","动漫"],
                    ["名言", "性格", "智商","礼仪","财富","职场","人际"]
            ];
            window.onload = function () {
                 
                var selJia = document.getElementById("ones");
                //申请空间
                selJia.length = jiaArr.length;
                //添加元素
                for (var i = 0; i < jiaArr.length; i++) {
                    selJia.options[i].text = jiaArr[i];
                    selJia.options[i].value = jiaArr[i];
                }
            }
     
            function ChangeExampleSelect(index)
            {
                var selExa = document.getElementById("twos");
     
                selExa.length = exampleArr[index].length;
     
                for (var i = 0; i < exampleArr[index].length; i++)
                {
                    selExa.options[i].text = exampleArr[index][i];
                    selExa.options[i].value = exampleArr[index][i];
                }
            }
                  		
        	