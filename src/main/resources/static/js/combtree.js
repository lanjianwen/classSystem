var Tree=function($tree){
    this.isInit=false;
    this.treeId=uuid(8,16);
    /**
     * 下拉树结构模版
     */
    this.domObj={
        combtree:$tree,
        input:$("<input type='text' class='form-control'  placeholder='请选择...' readonly   >"),
        i:$("<i class='glyphicon glyphicon-chevron-down'></i>"),
        drop:$("<div class='drop'></div>"),
        tree:$("<div class='ztree' id='"+this.treeId+"'></div>")
    };
    this.datas=[];
    this.setting={
        check: {
            enable: true
        },
        data: {
            simpleData: {
                enable: true
            }
        },
        callback: {
            onCheck: function(event, treeId, treeNode){
                var treeObj = $.fn.zTree.getZTreeObj(treeId);
                var nodes = treeObj.getCheckedNodes(true);
                var combtree=treeObj.context;
                if(nodes.length>0){
                    var selectNodesName=[];
                    var selectNodesId=[];
                    var setting=treeObj.setting.data.simpleData;
                    var id=setting.idKey;
                    nodes.forEach(function(el,index,arr){
                        if(!el.isParent){
                            selectNodesName.push(el["name"]);
                            selectNodesId.push(el[id]);
                        }
                    });
                    combtree.domObj.input.val(selectNodesName[0]+", ...");
                    combtree.domObj.input.attr("title",selectNodesName.join(","));
                    combtree.domObj.combtree.data("val",selectNodesId);
                }
            }
        }
    };
};
Tree.prototype= {
    /**
     * 初始化下拉树
     * @param options.datas 简单数据格式的树
     * @param options.otherSetting 可以对ztree的setting配置进行覆盖
     */
    init:function(options){
        this.datas=options.datas;
        delete options.datas;
        this.setting= $.extend(true,{},this.setting,options);
        this.buildDom();
        var treeObj=$.fn.zTree.init(this.domObj.tree, this.setting,this.datas);
        treeObj.expandAll(true);
        this.isInit=true;
        treeObj.context=this;
        //初始化选中,保存默认选中的值
        var nodes = treeObj.getCheckedNodes(true);
        if(nodes.length>0){
            var selectNodesName=[];
            var selectNodesId=[];
            var setting=treeObj.setting.data.simpleData;
            var id=setting.idKey;
            nodes.forEach(function(el,index,arr){
                if(!el.isParent){
                    selectNodesName.push(el["name"]);
                    selectNodesId.push(el[id]);
                }
            });
            this.domObj.input.val(selectNodesName[0]+", ...");
            this.domObj.input.attr("title",selectNodesName.join(","));
            this.domObj.combtree.data("val",selectNodesId);
        }
    },
    buildDom:function(){
        var dom=this.domObj;
        dom.combtree.append(dom.input).append(dom.i).append(dom.drop);
        dom.drop.append(dom.tree);
        dom.combtree.on("click",function(e){
            $(this).find(".drop").show();
            $(document).on("click", function(){
                if($(".drop").is(':visible'))$(".drop").hide();
            });
            e.stopPropagation();
        });
    },
    value:function(){
        return this.domObj.combtree.data("val")?this.domObj.combtree.data("val"):[];
    }
};