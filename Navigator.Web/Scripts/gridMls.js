﻿$("#toolbarMls").kendoToolBar({
    items: [
        { type: "button", text: "Конфигуратор", id: "btnconf" },
        { type: "button", text: "Toggle Button", togglable: true }
    ],
    click: onClick
});

var columns = [
        { width: 30, headerTemplate: "<input  type='checkbox' id='chkSelectAll' onclick='checkAll(this)' />", template: "<input  type='checkbox' class='chkbx'/>" },
        { field: "NumML", title: "№ МЛ", template: "<a href='' class='redlink'>#=NumML# </a><div class=\"valueDel\"></div> #= utverzh ? kendo.toString(utverzh, 'dd.MM.yyyy') : '' #", width: 150 },
        { field: "USERs", title: "Пользователь", width: 160, filterable: { cell: { operator: "contains" } } },
        { field: "Otvetstv", title: "Ответственный", width: 160 },
        { field: "Zakazhcik", title: "Заказчик", width: 190 },
        { field: "AdresA", title: "Адрес", template: "#=AdresA ? AdresA:'' # <div class=\"valueDel\"></div> #=AdresB ? AdresB:''#", width: 400 },
        { field: "AdressA", title: "Адрес СО", template: "#=AdressA ? AdressA:'' # <div class=\"valueDel\"></div> #=AdressB ? AdressB:''#", width: 400 },
        { title: "Услуга", field: "Usluga", template: "<table><tr><td>#=Usluga ? Usluga:'' #  &nbsp;</td></tr><tr><td>#=Skorost ? Skorost:'' #  &nbsp; </td></tr><tr><td></td></tr></table>", width: 100 },
        { field: "Styk_A", title: "Стык", template: "#=Styk_A ? Styk_A:'' # <div class=\"valueDel\"></div> #=Styk_B ? Styk_B:''#", width: 100 },
        { field: "PrivA", title: "Узел привязки", template: "#=PrivA ? PrivA:'' # <div class=\"valueDel\"></div> #=PrivB ? PrivB:''#", width: 100 },
        { field: "UDA", title: "Узел доступа", template: "#=UDA ? UDA:'' # <div class=\"valueDel\"></div> #=UDB ? UDB:''#", width: 100 },
        { field: "SpecOb", title: "Канал привязки", width: 120 },
        { field: "ChNumA", title: "F стыка", template: "#=ChNumA ? ChNumA:'' # <div class=\"valueDel\"></div> #=ChNumB ? ChNumB:''#", width: 100 },
        { field: "ESVTPIQQCNfe", title: "E,S,V,T,P,I,Q,QC,N,Ф", width: 100 },
        { field: "L", width: 100 }, { field: "E", width: 100 }, { field: "S", width: 100 }, { field: "V", width: 100 }, { field: "T", width: 100 },
        { field: "P", width: 100 }, { field: "I", width: 100 }, { field: "Q", width: 100 }, { field: "QC", width: 100 }, { field: "N", width: 100 },
        { field: "Fe", width: 100, title: "Ф" },
        { field: "gplr_start", title: "ГПЛР", template: "<table><tr><td >#=gplr_start ? kendo.toString(gplr_start,'dd.MM.yyyy'):'' #</td><td>#=gplr2_start ? kendo.toString(gplr2_start,'dd.MM.yyyy'):'' #</td></tr><tr><td>#=gplr_end ? kendo.toString(gplr_end,'dd.MM.yyyy'):'' # #=gplrIsCanceled ? gplrIsCanceled:'' #</td><td>#=gplr2_end ? kendo.toString(gplr2_end,'dd.MM.yyyy'):'' # #=gplr2IsCanceled ? gplr2IsCanceled:''#</td></tr></table>", width: 160 },
        { field: "dmv_start", title: "ДМВ", template: "<table><tr><td >#=dmv_start ? kendo.toString(dmv_start,'dd.MM.yyyy'):'' #</td><td>#=dmv2_start ? kendo.toString(dmv2_start,'dd.MM.yyyy'):'' #</td></tr><tr><td>#=dmv_end ? kendo.toString(dmv_end,'dd.MM.yyyy'):'' # #=dmvIsCanceled ? dmvIsCanceled:'' #</td><td>#=dmv2_end ? kendo.toString(dmv2_end,'dd.MM.yyyy'):'' #  #=dmv2IsCanceled ? dmv2IsCanceled:''#</td></tr></table>", width: 160 },
        { field: "osp_start", title: "ОСП", template: "#=osp_start ? kendo.toString(osp_start,'dd.MM.yyyy'):'' #<div class=\"valueDel\"></div>#=osp_end ? kendo.toString(osp_end,'dd.MM.yyyy'):'' # #=ospIsCanceled ? ospIsCanceled:'' #", width: 160 },
        { field: "uiias_h_start", title: "ОЦОДиТ", template: "#=uiias_h_start ? kendo.toString(uiias_h_start,'dd.MM.yyyy'):'' #<div class=\"valueDel\"></div>#=uiias_h_end ? kendo.toString(uiias_h_end,'dd.MM.yyyy'):'' # #=uiias_hIsCanceled ? uiias_hIsCanceled:'' #", width: 160 },
        { field: "oshugpu_start", title: "ОШУГПУ", template: "#=oshugpu_start ? kendo.toString(oshugpu_start,'dd.MM.yyyy'):'' #<div class=\"valueDel\"></div>#=oshugpu_end ? kendo.toString(oshugpu_end,'dd.MM.yyyy'):'' # #=oshugpuIsCanceled ? oshugpuIsCanceled:'' #", width: 160 },
        { field: "oshugpz_start", title: "ГФЗ", template: "#=oshugpz_start ? kendo.toString(oshugpz_start,'dd.MM.yyyy'):'' #<div class=\"valueDel\"></div>#=oshugpz_end ? kendo.toString(oshugpz_end,'dd.MM.yyyy'):'' # #=oshugpzIsCanceled ? oshugpzIsCanceled:'' #", width: 160 },
        { field: "to_start", title: "ТО", template: "<table><tr><td >#=to_start ? kendo.toString(to_start,'dd.MM.yyyy'):''#</td><td>#=to2_start ? kendo.toString(to2_start,'dd.MM.yyyy'):''#</td></tr><tr><td>#=to_end ? kendo.toString(to_end,'dd.MM.yyyy'):''# #=toIsCanceled ? toIsCanceled:''#</td><td>#=to2_end ? kendo.toString(to2_end,'dd.MM.yyyy'):''# #=to2IsCanceled ? to2IsCanceled:''#</td></tr></table>", width: 160 },
        { field: "otse_start", title: "ОТС(Е)", template: "<table><tr><td >#=otse_start ? kendo.toString(otse_start,'dd.MM.yyyy'):''#</td><td>#=otse2_start ? kendo.toString(otse2_start,'dd.MM.yyyy'):''#</td></tr><tr><td>#=otse_end ? kendo.toString(otse_end,'dd.MM.yyyy'):''# #=otseIsCanceled ? otseIsCanceled:''#</td><td>#=otse2_end ? kendo.toString(otse2_end,'dd.MM.yyyy'):''# #=otse2IsCanceled ? otse2IsCanceled:''#</td></tr></table>", width: 190 },
        { field: "otss_start", title: "ОТС(S)", template: "<table><tr><td >#=otss_start ? kendo.toString(otss_start,'dd.MM.yyyy'):''#</td><td>#=otss2_start ? kendo.toString(otss2_start,'dd.MM.yyyy'):''#</td></tr><tr><td>#=otss_end ? kendo.toString(otss_end,'dd.MM.yyyy'):''# #=otssIsCanceled ? otssIsCanceled:''#</td><td>#=otss2_end ? kendo.toString(otss2_end,'dd.MM.yyyy'):''# #=otss2IsCanceled ? otss2IsCanceled:''#</td></tr></table>", width: 190 },
        { field: "otu_start", title: "ОТУ", template: "#=otu_start ? kendo.toString(otu_start,'dd.MM.yyyy'):'' #<div class=\"valueDel\"></div>#=otu_end ? kendo.toString(otu_end,'dd.MM.yyyy'):'' # #=otuIsCanceled ? otuIsCanceled:'' #", width: 190 },
        { field: "otvu_start", title: "ОТвУ", template: "#=otvu_start ? kendo.toString(otvu_start,'dd.MM.yyyy'):'' #<div class=\"valueDel\"></div>#=otvu_end ? kendo.toString(otvu_end,'dd.MM.yyyy'):'' # #=otvuIsCanceled ? otvuIsCanceled:'' #", width: 190 },
        { field: "TaskReturns", title: "Возврат МЛ", width: 120 },
        { field: "TaskCancels", title: "Возврат заданий", width: 120 },
        { field: "StartDate", title: "Заморозка", template: "#=StartDate ? kendo.toString(StartDate,'dd.MM.yyyy'):'' # <div class=\"valueDel\"></div> #=StopDate ? kendo.toString(StopDate,'dd.MM.yyyy'):''#", width: 160 },
        { field: "Probl", title: "Проблема", width: 130 },
        { field: "Prim", title: "Примечание", width: 130 },
        { field: "Operator", title: "Наименование СО", width: 180 },
        { field: "test_date_a", title: "Тест СО", width: 190, template: "<table><tr><td>#=test_date_a ? kendo.toString(test_date_a,'dd.MM.yyyy'):''#</td><td>#=test_res_a ? test_res_a:''#&nbsp;</td></tr><tr><td>#=test_date_b ? kendo.toString(test_date_b,'dd.MM.yyyy'):''#&nbsp;</td><td>#=test_res_b ? test_res_a:''#&nbsp;</td></tr></table>" },
        { field: "SpecProject", title: "Спецпроект", width: 130 }
];

$("#gridMls").kendoGrid({
    dataSource: {
        transport: {
            read: {
                url: "ListMLs/GetListMls",
                dataType: "json",
                type: "POST"
            }
        }, pageSize: 20,
        serverPaging: true,
        serverSorting: true,
        serverFiltering: true,
        schema: {
            data: "data", total: "total",
            model: {
                fields: {
                    utverzh: { type: "date" },
                    gplr_start: { type: "date" },
                    gplr2_start: { type: "date" },
                    gplr_end: { type: "date" },
                    gplr2_end: { type: "date" },
                    dmv_start: { type: "date" },
                    dmv2_start: { type: "date" },
                    dmv_end: { type: "date" },
                    dmv2_end: { type: "date" },
                    osp_start: { type: "date" },
                    osp_end: { type: "date" },
                    oshugpz_start: { type: "date" },
                    oshugpz_end: { type: "date" },
                    uiias_h_start: { type: "date" },
                    uiias_h_end: { type: "date" },
                    test_date_a: { type: "date" },
                    test_date_b: { type: "date" },
                    Sdan: { type: "date" },
                    Sdan_TS: { type: "date" },
                    to_start: { type: "date" },
                    to2_start: { type: "date" }, to_end: { type: "date" }, to2_end: { type: "date" }, to2IsCanceled: { type: "date" },
                    otse_start: { type: "date" },
                    otse2_start: { type: "date" }, otse_end: { type: "date" }, otse2_end: { type: "date" }, otss_start: { type: "date" }, otss2_start: { type: "date" }, otss_end: { type: "date" }, otss2_end: { type: "date" }, otu_start: { type: "date" }, otu_end: { type: "date" },
                    StartDate: { type: "date" }, StopDate: { type: "date" },
                    test_date_a: { type: "date" },
                    test_date_b: { type: "date" },
                }
            }
        }
    },
    height: 720,
    editable: true,
    filterable: { mode: "row" },
    columnMenu: true,
    sortable: { mode: "multiple", allowUnsort: true },
    pageable: {
        messages: {
            display: "{0} - {1} из {2} элементов",
            empty: "No items to display",
            of: "из {0}",
            itemsPerPage: "элементов на странице",
            refresh: "Обновить"
        }
    },
    selectable: "multiple",
    resizable: true,
    reorderable: true,
    pageable: {
        refresh: true,
        pageSizes: [10, 20, 50],
        buttonCount: 5
    },
    columns: columns
});

function onClick(e) {
    $("#configurator").show();
    $("#windowConf").kendoWindow({
        title: "Конфигуратор",
        actions: ["Refresh", "Minimize", "Maximize", "Close"],
        width: 580
    }).data("kendoWindow").center().open();

}
function checkAll(ele) {
    var state = $(ele).is(':checked');
    var grid = $('#grid').data('kendoGrid');
    $.each(grid.dataSource.view(), function () {
        //if (this['IsSelected'] != state)
        this.dirty = true;
        //this['IsSelected'] = state;
    });
    grid.refresh();
}