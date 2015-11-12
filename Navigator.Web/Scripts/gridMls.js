$("#toolbarMls").kendoToolBar({ items: [{ type: "button", text: "Принять", id: "btnAccept" }, { type: "button", text: "Снять", id: "btnTakeOff" }, { type: "button", title: "Обновить", id: "btnRefresh", icon: "refresh" }, { type: "button", text: "Конфигуратор", id: "btnconf", click: buttonClickOpenConf }, { type: "button", text: "Очистить фильтпы", id: "btnclear", click: buttonClickClearFilters }], click: onClick });
var items = [{ text: "Выдано", value: "1" }, { text: "Не выдано", value: "2" }, { text: "Выполнено", value: "3" }];
var filterDep = { mode: "row", cell: { showOperators: false, template: function (args) { args.element.kendoDropDownList({ autoBind: false, dataTextField: "text", dataValueField: "value", dataSource: new kendo.data.DataSource({ data: items }), index: 0, optionLabel: { text: "Без фильтра", value: "" }, valuePrimitive: true }); } } };
var filterFreezen = {
    mode: "row",
    cell: {
        showOperators: false,
        template: function (args) {
            args.element.kendoDropDownList({
                autoBind: false, dataTextField: "text", dataValueField: "value",
                dataSource: new kendo.data.DataSource({ data: [{ text: "Замороженные", value: "1" }, { text: "Размороженные", value: "2" }, { text: "Без приостановоу", value: "3" }] }),
                index: 0, optionLabel: { text: "Без фильтра", value: "" }, valuePrimitive: true,
                change: function () {
                    var value = this.value();
                    var ds = $("#gridMls").data("kendoGrid").dataSource;
                    var new_filter = { field: "Freeze_ReportExist", operator: "eq", value: parseInt(value) };
                    if (value) {
                        var curr_filters = null;
                        if (ds.filter() != null) {
                            curr_filters = ds.filter().filters;
                            curr_filters = removeFilter(curr_filters, 'Freeze_ReportExist');
                            curr_filters.push(new_filter);
                        }
                        if (curr_filters == null) {
                            curr_filters = [new_filter];
                        }
                        ds.filter(curr_filters);
                    } else {
                        var filters = ds.filter().filters;
                        filters = removeFilter(filters, 'Freeze_ReportExist');
                    }
                }
            });
        }
    }
};
var filterEmpty = { mode: "row", cell: { showOperators: false } };

var columns = [
        { width: 30, headerTemplate: "<input type='checkbox' id='checkAll' onClick='selectAll(this)'/>", template: "<input type='checkbox' name='selectItem' class='checkbox' />", locked: false },
        { command: [{ name: "edit", text: { edit: "", update: "", cancel: "" } }], title: "&nbsp;", text: "", width: 44, locked: false },
        { field: "NumML", title: "№ МЛ", template: "<a href='' class='redlink'>#=NumML# </a><div class=\"valueDel\"></div> #= utverzh ? kendo.toString(utverzh, 'dd.MM.yyyy') : '' #", width: 150, locked: false, editable: false },
        { field: "USERs", title: "Пользователь", width: 160, filterable: { cell: { operator: "contains" } } },
        { field: "Otvetstv", title: "Ответственный", width: 160, filterable: { cell: { operator: "contains" } } },
        { field: "Zakazhcik", title: "Заказчик", width: 190, filterable: { cell: { operator: "contains" } } },
        { field: "AdresA", title: "Адрес", template: "#=AdresA ? AdresA:'' # <div class=\"valueDel\"></div> #=AdresB ? AdresB:''#", width: 400, filterable: { cell: { operator: "contains" } } },
        { field: "AdressA", title: "Адрес СО", template: "#=AdressA ? AdressA:'' # <div class=\"valueDel\"></div> #=AdressB ? AdressB:''#", width: 400, filterable: { cell: { operator: "contains" } } },
        { title: "Услуга", field: "Usluga", template: "<table><tr><td>#=Usluga ? Usluga:'' #  &nbsp;</td></tr><tr><td>#=Skorost ? Skorost:'' #  &nbsp; </td></tr><tr><td></td></tr></table>", width: 100, filterable: { cell: { operator: "contains" } } },
        { field: "Styk_A", title: "Стык", template: "#=Styk_A ? Styk_A:'' # <div class=\"valueDel\"></div> #=Styk_B ? Styk_B:''#", width: 150, filterable: { cell: { operator: "contains" } } },
        { field: "PrivA", title: "Узел привязки", template: "#=PrivA ? PrivA:'' # <div class=\"valueDel\"></div> #=PrivB ? PrivB:''#", width: 190, filterable: { cell: { operator: "contains" } } },
        { field: "UDA", title: "Узел доступа", template: "#=UDA ? UDA:'' # <div class=\"valueDel\"></div> #=UDB ? UDB:''#", width: 190, filterable: { cell: { operator: "contains" } } },
        { field: "SpecOb", title: "Канал привязки", width: 120, filterable: { cell: { operator: "contains" } } },
        { field: "ChNumA", title: "F стыка", template: "#=ChNumA ? ChNumA:'' # <div class=\"valueDel\"></div> #=ChNumB ? ChNumB:''#", width: 130, filterable: { cell: { operator: "contains" } } },
        { field: "ESVTPIQQCNfe", title: "E,S,V,T,P,I,Q,QC,N,Ф", width: 150, filterable: { cell: { operator: "contains" } } }, { field: "L", width: 130, filterable: { cell: { operator: "contains" } } }, { field: "E", width: 130 }, { field: "S", width: 100, filterable: { cell: { operator: "contains" } } }, { field: "V", width: 130, filterable: { cell: { operator: "contains" } } }, { field: "T", width: 130, filterable: { cell: { operator: "contains" } } }, { field: "P", width: 130, filterable: { cell: { operator: "contains" } } }, { field: "I", width: 130, filterable: { cell: { operator: "contains" } } }, { field: "Q", width: 130, filterable: { cell: { operator: "contains" } } }, { field: "QC", width: 130, filterable: { cell: { operator: "contains" } } }, { field: "N", width: 130, filterable: { cell: { operator: "contains" } } }, { field: "Fe", width: 130, title: "Ф", filterable: { cell: { operator: "contains" } } },
        { field: "gplr_ReportExist", editable: false, title: "ГПЛР", type: "number", filterable: filterDep, template: "<table><tr><td >#=gplr_start ? kendo.toString(gplr_start,'dd.MM.yyyy'):'' #</td><td>#=gplr2_start ? kendo.toString(gplr2_start,'dd.MM.yyyy'):'' #</td></tr><tr><td>#=gplr_end ? kendo.toString(gplr_end,'dd.MM.yyyy'):'' # #=gplrIsCanceled ? gplrIsCanceled:'' #</td><td>#=gplr2_end ? kendo.toString(gplr2_end,'dd.MM.yyyy'):'' # #=gplr2IsCanceled ? gplr2IsCanceled:''#</td></tr></table>", width: 160 },
        { field: "dmv_ReportExist", editable: false, type: "number", title: "ДМВ", filterable: filterDep, template: "<table><tr><td >#=dmv_start ? kendo.toString(dmv_start,'dd.MM.yyyy'):'' #</td><td>#=dmv2_start ? kendo.toString(dmv2_start,'dd.MM.yyyy'):'' #</td></tr><tr><td>#=dmv_end ? kendo.toString(dmv_end,'dd.MM.yyyy'):'' # #=dmvIsCanceled ? dmvIsCanceled:'' #</td><td>#=dmv2_end ? kendo.toString(dmv2_end,'dd.MM.yyyy'):'' #  #=dmv2IsCanceled ? dmv2IsCanceled:''#</td></tr></table>", width: 160 },
        { field: "osp_ReportExist", editable: false, title: "ОСП", filterable: filterDep, template: "#=osp_start ? kendo.toString(osp_start,'dd.MM.yyyy'):'' #<div class=\"valueDel\"></div>#=osp_end ? kendo.toString(osp_end,'dd.MM.yyyy'):'' # #=ospIsCanceled ? ospIsCanceled:'' #", width: 160 },
        { field: "otsod_ReportExist", editable: false, title: "ОЦОДиТ", filterable: filterDep, template: "#=uiias_h_start ? kendo.toString(uiias_h_start,'dd.MM.yyyy'):'' #<div class=\"valueDel\"></div>#=uiias_h_end ? kendo.toString(uiias_h_end,'dd.MM.yyyy'):'' # #=uiias_hIsCanceled ? uiias_hIsCanceled:'' #", width: 160 },
        { field: "ushugpu_ReportExist", editable: false, title: "ОШУГПУ", filterable: filterDep, template: "#=oshugpu_start ? kendo.toString(oshugpu_start,'dd.MM.yyyy'):'' #<div class=\"valueDel\"></div>#=oshugpu_end ? kendo.toString(oshugpu_end,'dd.MM.yyyy'):'' # #=oshugpuIsCanceled ? oshugpuIsCanceled:'' #", width: 160 },
        { field: "oshugpz_start", editable: false, title: "ГФЗ", filterable: filterEmpty, template: "#=oshugpz_start ? kendo.toString(oshugpz_start,'dd.MM.yyyy'):'' #<div class=\"valueDel\"></div>#=oshugpz_end ? kendo.toString(oshugpz_end,'dd.MM.yyyy'):'' # #=oshugpzIsCanceled ? oshugpzIsCanceled:'' #", width: 380 },
        { field: "to_ReportExist", editable: false, title: "ТО", filterable: filterDep, template: "<table><tr><td >#=to_start ? kendo.toString(to_start,'dd.MM.yyyy'):''#</td><td>#=to2_start ? kendo.toString(to2_start,'dd.MM.yyyy'):''#</td></tr><tr><td>#=to_end ? kendo.toString(to_end,'dd.MM.yyyy'):''# #=toIsCanceled ? toIsCanceled:''#</td><td>#=to2_end ? kendo.toString(to2_end,'dd.MM.yyyy'):''# #=to2IsCanceled ? to2IsCanceled:''#</td></tr></table>", width: 190 },
        { field: "otse_ReportExist", editable: false, title: "ОТС(Е)", filterable: filterDep, template: "<table><tr><td >#=otse_start ? kendo.toString(otse_start,'dd.MM.yyyy'):''#</td><td>#=otse2_start ? kendo.toString(otse2_start,'dd.MM.yyyy'):''#</td></tr><tr><td>#=otse_end ? kendo.toString(otse_end,'dd.MM.yyyy'):''# #=otseIsCanceled ? otseIsCanceled:''#</td><td>#=otse2_end ? kendo.toString(otse2_end,'dd.MM.yyyy'):''# #=otse2IsCanceled ? otse2IsCanceled:''#</td></tr></table>", width: 190 },
        { field: "otss_ReportExist", editable: false, title: "ОТС(S)", filterable: filterDep, template: "<table><tr><td >#=otss_start ? kendo.toString(otss_start,'dd.MM.yyyy'):''#</td><td>#=otss2_start ? kendo.toString(otss2_start,'dd.MM.yyyy'):''#</td></tr><tr><td>#=otss_end ? kendo.toString(otss_end,'dd.MM.yyyy'):''# #=otssIsCanceled ? otssIsCanceled:''#</td><td>#=otss2_end ? kendo.toString(otss2_end,'dd.MM.yyyy'):''# #=otss2IsCanceled ? otss2IsCanceled:''#</td></tr></table>", width: 190 },
        { field: "otu_ReportExist", editable: false, title: "ОТУ", filterable: filterDep, template: "#=otu_start ? kendo.toString(otu_start,'dd.MM.yyyy'):'' #<div class=\"valueDel\"></div>#=otu_end ? kendo.toString(otu_end,'dd.MM.yyyy'):'' # #=otuIsCanceled ? otuIsCanceled:'' #", width: 190 },
        { field: "otvu_ReportExist", editable: false, title: "ОТвУ", filterable: filterDep, template: "#=otvu_start ? kendo.toString(otvu_start,'dd.MM.yyyy'):'' #<div class=\"valueDel\"></div>#=otvu_end ? kendo.toString(otvu_end,'dd.MM.yyyy'):'' # #=otvuIsCanceled ? otvuIsCanceled:'' #", width: 190 },
        { field: "TaskReturns", title: "Возврат МЛ", filterable: filterEmpty, width: 280 },
        { field: "TaskCancels", title: "Возврат заданий", width: 190, filterable: { cell: { operator: "contains" } } },
        { field: "Freeze_ReportExist", title: "Заморозка", editable: false, filterable: filterFreezen, template: "#=StartDate ? kendo.toString(StartDate,'dd.MM.yyyy'):'' # <div class=\"valueDel\"></div> #=StopDate ? kendo.toString(StopDate,'dd.MM.yyyy'):''#", width: 160 },
        { field: "Probl", title: "Проблема", width: 190, filterable: { cell: { operator: "contains" } } },
        { field: "Prim", title: "Примечание", width: 130, filterable: { cell: { operator: "contains" } } },
        { field: "Operator", title: "Наименование СО", width: 180, filterable: { cell: { operator: "contains" } } },
        { field: "test_date_a", title: "Тест СО", width: 190, filterable: false, template: "<table><tr><td>#=test_date_a ? kendo.toString(test_date_a,'dd.MM.yyyy'):''#</td><td>#=test_res_a ? test_res_a:''#&nbsp;</td></tr><tr><td>#=test_date_b ? kendo.toString(test_date_b,'dd.MM.yyyy'):''#&nbsp;</td><td>#=test_res_b ? test_res_a:''#&nbsp;</td></tr></table>" },
        { field: "SpecProject", title: "Спецпроект", width: 130, filterable: { cell: { operator: "contains" } } },
        { field: "Urgent", title: "Срочность", template: " <input type='checkbox' #= Sroch_USHTU ? 'checked=checked' : '' # disabled='disabled' ></input> #=Sroch_SZ?Sroch_SZ:''#", width: 280 },
        { field: "Line", editable: false, title: "Линия", template: "<button onclick='myFunction(#=NumML#)' class='k-button k-toolbar-last-visible'>Линия</button>", width: 130 },
        { field: "UspState", title: "Статус УСП", editable: false, filterable: false, template: "<input type='checkbox' #= Ivanov_Gulka ? 'checked=checked' : '' # disabled='disabled' >   <input type='checkbox' #= NMR ? 'checked=checked' : '' # disabled='disabled' >", width: 130 },
        { field: "Sdan", editable: false, title: "Сдан", width: 100, type: "date", filterable: false, format: "{0:dd.MM.yyyy}" },
        { field: "Sdan_TS", editable: false, title: "Сдан ТС", width: 100, type: "date", filterable: false, format: "{0:dd.MM.yyyy}" }
];
var fields = {
    NumML: { editable: false }, USERs: { editable: false }, Otvetstv: { editable: false }, Zakazhcik: { editable: false }, AdresA: { editable: false }, AdressA: { editable: false }, UspState: { editable: false },
    gplr_ReportExist: { editable: false }, dmv_ReportExist: { editable: false }, osp_ReportExist: { editable: false }, otsod_ReportExist: { editable: false }, ushugpu_ReportExist: { editable: false }, oshugpz_start: { editable: false }, to_ReportExist: { editable: false }, otse_ReportExist: { editable: false },
    otss_ReportExist: { editable: false }, otu_ReportExist: { editable: false }, otvu_ReportExist: { editable: false },
    utverzh: { type: "date" }, gplr_start: { type: "date" }, gplr2_start: { type: "date" }, gplr_end: { type: "date" }, gplr2_end: { type: "date" }, dmv_start: { type: "date" }, dmv2_start: { type: "date" }, dmv_end: { type: "date" },
    dmv2_end: { type: "date" }, osp_start: { type: "date" }, osp_end: { type: "date" }, oshugpz_start: { type: "date", format: "dd.MM.yyyy" }, oshugpu_start: { type: "date" }, oshugpu_end: { type: "date" }, oshugpz_end: { type: "date" },
    otvu_start: { type: "date" }, otvu_end: { type: "date" }, otu_start: { type: "date" }, otu_end: { type: "date" }, uiias_h_start: { type: "date" }, uiias_h_end: { type: "date" }, test_date_a: { type: "date" },
    test_date_b: { type: "date" }, Sdan: { type: "date" }, Sdan_TS: { type: "date" }, to_start: { type: "date" }, to2_start: { type: "date" }, to_end: { type: "date" }, to2_end: { type: "date" }, to2IsCanceled: { type: "date" },
    otse_start: { type: "date" }, otse2_start: { type: "date" }, otse_end: { type: "date" }, otse2_end: { type: "date" }, otss_start: { type: "date" }, otss2_start: { type: "date" }, otss_end: { type: "date" }, otss2_end: { type: "date" }, otu_start: { type: "date" }, otu_end: { type: "date" },
    StartDate: { type: "date" }, StopDate: { type: "date" }, test_date_a: { type: "date" }, test_date_b: { type: "date" }, dmv_ReportExist: { type: "number" }, gplr_ReportExist: { type: "number" }, Sroch_USHTU: { type: "boolean" }
};
var selectedIds = {};

var gridMls = $("#gridMls").kendoGrid({
    dataSource: {
        transport: { read: { url: "ListMLs/GetListMls", dataType: "json", type: "POST" } },
        pageSize: 20, serverPaging: true, serverSorting: true, serverFiltering: true, schema: { data: "data", total: "total", id: "NumML", model: { fields: fields } }
    }, height: $(document).height() - 80,
    editable: "inline", filterable: { mode: "row", extra: false }, columnMenu: true, sortable: { mode: "multiple", allowUnsort: true }, pageable: true,
    //   selectable: "multiple",
    resizable: true, reorderable: true,
    pageable: { refresh: true, pageSizes: [10, 20, 50, 100], buttonCount: 5 }, columns: columns, dataBound: function () {
        $(".checkbox").bind("change", function (e) {
            $(e.target).closest("tr").toggleClass("k-state-selected");
        });
    }

});


AddCustomFilter('oshugpz_start', '<table><tr><td style="width:25%;"><input id="from"/></td><td style="width:25%;"><input id="to"/></td><td style="width:40%;"><input id="dropdownlistGfz" /></td><td style="width:10%;"><button type="button" onclick="ClearFilterFGZ()" class="k-button k-button-icon"  style="display: visible;"><span class="k-icon k-i-close"></span></button></td></tr></table>');
AddCustomFilter('Urgent', '<table><tr><td style="width:43%;"><input type="text" id="SrochSZ" style="width:100%;" class="k-input k-textbox" role="textbox"/></td></td><td style="width:43%;"><input id="dropdownlistUrgent" /></td><td style="width:14%;"><button type="button" onclick="ClearFilterUrgent()" class="k-button k-button-icon"  style="display: visible;"><span class="k-icon k-i-close"></span></button></td></tr></table>');
AddCustomFilter('TaskReturns', '<table><tr><td style="width:43%;"><input id="returnDate"/></td></td><td style="width:43%;"><input id="dropdownlistTaskReturns" /></td><td style="width:14%;"><button type="button" onclick="ClearFilterTaskReturns()" class="k-button k-button-icon"  style="display: visible;"><span class="k-icon k-i-close"></span></button></td></tr></table>');

function AddCustomFilter(field, content) {
    var columnHeader = jQuery('div#gridMls span.k-filtercell[data-field="' + field + '"]');
    var fieldValue = jQuery(content);
    columnHeader.empty();
    columnHeader.append(fieldValue);
}
function ClearFilterFGZ() {
    var gridData = $("#gridMls").data("kendoGrid");
    var dsGFZ = gridData.dataSource;
    if (dsGFZ.filter() != null) {
        var filtersGFZ = dsGFZ.filter().filters;
        filtersGFZ = removeFilter(filtersGFZ, 'oshugpz_ReportExist');
        filtersGFZ = removeFilter(filtersGFZ, 'oshugpz_start');
        filtersGFZ = removeFilter(filtersGFZ, 'oshugpz_end');
        gridData.dataSource.filter(filtersGFZ);
        $("#dropdownlistGfz").data("kendoDropDownList").value(-1);
        $("#from").data("kendoDatePicker").value("");
        $("#to").data("kendoDatePicker").value("");
    }
}
function ClearFilterUrgent() {
    var gridDataUrgent = $("#gridMls").data("kendoGrid");
    var dsUrgent = gridDataUrgent.dataSource;
    if (dsUrgent.filter() != null) {
        var filtersUrgent = dsUrgent.filter().filters;
        filtersUrgent = removeFilter(filtersUrgent, 'Sroch_USHTU');
        filtersUrgent = removeFilter(filtersUrgent, 'Sdan_TS');
        filtersUrgent = removeFilter(filtersUrgent, 'Sroch_SZ');
        gridDataUrgent.dataSource.filter(filtersUrgent);
        $("#dropdownlistUrgent").data("kendoDropDownList").value(-1);
        $("#SrochSZ").val("");
    }
}
$("#SrochSZ").keypress(function (e) {
    if (e.which == 13) {
        var gridData = $("#gridMls").data("kendoGrid");
        var ds = gridData.dataSource;
        var new_filter;
        var curr_filters = null;
        $("#dropdownlistUrgent").data("kendoDropDownList").value(1);
        var ungentText = $("#SrochSZ").val();
        if (ungentText != "")
        { new_filter = { field: "Sroch_SZ", operator: "contains", value: ungentText }; }
        if (ds.filter() != null) {
            curr_filters = ds.filter().filters;
            curr_filters = removeFilter(curr_filters, 'Sroch_USHTU'); curr_filters = removeFilter(curr_filters, 'Sdan_TS'); curr_filters = removeFilter(curr_filters, 'Sroch_SZ');
            curr_filters.push(new_filter);
        }
        if (curr_filters == null) {
            curr_filters = [new_filter];
        }
        ds.filter(curr_filters);
    }
});
$("#dropdownlistUrgent").kendoDropDownList({
    autoBind: false, dataTextField: "text", dataValueField: "value",
    dataSource: new kendo.data.DataSource({ data: [{ text: "Содержит", value: "1" }, { text: "Срочные", value: "2" }, { text: "Не срочные", value: "3" }, { text: "Срочные не выполненые", value: "4" }] }),
    index: 0, optionLabel: { text: "Без фильтра", value: "" },
    change: function () {
        var value = this.value();
        var gridData = $("#gridMls").data("kendoGrid");
        var ds = gridData.dataSource;
        if (value) {
            var curr_filters = null;
            var new_filter;
            var notperform;
            if (value == "1") {
                var ungentText = $("#SrochSZ").val();
                if (ungentText != "")
                { new_filter = { field: "Sroch_SZ", operator: "contains", value: ungentText }; }
            }
            else if (value == "2") {
                new_filter = { field: "Sroch_USHTU", operator: "eq", value: true };
            }
            else if (value == "3") {
                new_filter = { field: "Sroch_USHTU", operator: "eq", value: false };
            }
            else if (value == "4") {
                new_filter = { field: "Sroch_USHTU", operator: "eq", value: true };
                notperform = { field: "Sdan_TS", operator: "eq", value: null };
            }
            if (ds.filter() != null) {
                curr_filters = ds.filter().filters;
                curr_filters = removeFilter(curr_filters, 'Sroch_USHTU'); curr_filters = removeFilter(curr_filters, 'Sdan_TS'); curr_filters = removeFilter(curr_filters, 'Sroch_SZ');
                if (value == "4") {

                    curr_filters.push(notperform);
                }
                curr_filters.push(new_filter);
            }
            if (curr_filters == null) {
                curr_filters = [new_filter];
                if (value == "4") { curr_filters.push(notperform); }
            }
            ds.filter(curr_filters);
        }
        else {
            if (ds.filter() != null) {
                var filters = ds.filter().filters;
                filters = removeFilter(filters, 'Sroch_USHTU');
                filters = removeFilter(filters, 'Sroch_SZ');
                gridData.dataSource.filter(filters);
            }

        }
    }
});
$("#dropdownlistTaskReturns").kendoDropDownList({
    autoBind: false, dataTextField: "text", dataValueField: "value",
    dataSource: new kendo.data.DataSource({ data: [{ text: "Содержит", value: "1" }, { text: "Срочные", value: "2" }, { text: "Не срочные", value: "3" }, { text: "Срочные не выполненые", value: "4" }] }),
    index: 0, optionLabel: { text: "Без фильтра", value: "" },
    change: function () {
        var value = this.value();
        var gridData = $("#gridMls").data("kendoGrid");
        var ds = gridData.dataSource;
        if (value) {
            var curr_filters = null;
            var new_filter;
            var notperform;
            if (value == "1") {
                var ungentText = $("#SrochSZ").val();
                if (ungentText != "")
                { new_filter = { field: "Sroch_SZ", operator: "contains", value: ungentText }; }
            }
            else if (value == "2") {
                new_filter = { field: "Sroch_USHTU", operator: "eq", value: true };
            }
            else if (value == "3") {
                new_filter = { field: "Sroch_USHTU", operator: "eq", value: false };
            }
            else if (value == "4") {
                new_filter = { field: "Sroch_USHTU", operator: "eq", value: true };
                notperform = { field: "Sdan_TS", operator: "eq", value: null };
            }
            if (ds.filter() != null) {
                curr_filters = ds.filter().filters;
                curr_filters = removeFilter(curr_filters, 'Sroch_USHTU'); curr_filters = removeFilter(curr_filters, 'Sdan_TS'); curr_filters = removeFilter(curr_filters, 'Sroch_SZ');
                if (value == "4") {

                    curr_filters.push(notperform);
                }
                curr_filters.push(new_filter);
            }
            if (curr_filters == null) {
                curr_filters = [new_filter];
                if (value == "4") { curr_filters.push(notperform); }
            }
            ds.filter(curr_filters);
        }
        else {
            if (ds.filter() != null) {
                var filters = ds.filter().filters;
                filters = removeFilter(filters, 'Sroch_USHTU');
                filters = removeFilter(filters, 'Sroch_SZ');
                gridData.dataSource.filter(filters);
            }

        }
    }
});
function selectAll(source) {
    checkboxes = document.getElementsByName('selectItem');
    for (var i = 0, n = checkboxes.length; i < n; i++) {
        checkboxes[i].checked = source.checked;       
    }
    var datasourcedata = $("#gridMls").data("kendoGrid");
    if (source.checked) {
        datasourcedata.tbody.children('tr').addClass('k-state-selected');
    }
    else {
        datasourcedata.tbody.children('tr').removeClass('k-state-selected');
    }
}

$("#to").kendoDatePicker();
$("#returnDate").kendoDatePicker();
$("#from").kendoDatePicker({ format: "dd.MM.yyyy", change: function (e) { var to = $("#to").data("kendoDatePicker"); if (to.value() == null) { to.value(new Date()); } } });

$("#dropdownlistGfz").kendoDropDownList({
    autoBind: false, dataTextField: "text", dataValueField: "value", dataSource: new kendo.data.DataSource({ data: [{ text: "Выдано", value: "1" }, { text: "Не выдано", value: "2" }, { text: "Выполнено", value: "3" }, { text: "Выдано впервые", value: "4" }] }),
    index: 0, optionLabel: { text: "Без фильтра", value: "" },
    change: function () {
        var value = this.value();
        var gridData = $("#gridMls").data("kendoGrid");
        var ds = gridData.dataSource;
        var new_filter = { field: "oshugpz_ReportExist", operator: "eq", value: parseInt(value) };
        if (value) {
            var curr_filters = null;
            var filterfrom = null;
            var from = $("#from").data("kendoDatePicker");
            var to = $("#to").data("kendoDatePicker");
            if (value == 3) {
                filterFrom = { field: "oshugpz_end", operator: "gte", value: kendo.toString(from.value(), "dd.MM.yyyy") };
                filterTo = { field: "oshugpz_end", operator: "lte", value: kendo.toString(to.value(), "dd.MM.yyyy") };
            }
            else {
                filterFrom = { field: "oshugpz_start", operator: "gte", value: kendo.toString(from.value(), "dd.MM.yyyy") };
                filterTo = { field: "oshugpz_start", operator: "lte", value: kendo.toString(to.value(), "dd.MM.yyyy") };
            }

            if (ds.filter() != null) {
                curr_filters = ds.filter().filters;
                curr_filters = removeFilter(curr_filters, 'oshugpz_ReportExist');
                curr_filters.push(new_filter);
                if (from.value() != null) {
                    if (value == 3) { curr_filters = removeFilter(curr_filters, 'oshugpz_end'); }
                    else { curr_filters = removeFilter(curr_filters, 'oshugpz_start'); }
                    curr_filters.push(filterFrom);
                    curr_filters.push(filterTo);
                }
            }
            else {
                curr_filters = [new_filter];
                if (from.value() != null) {
                    curr_filters.push(filterFrom);
                    curr_filters.push(filterTo);
                }
            }
            ds.filter(curr_filters);
        } else {
            if (ds.filter() != null) {
                var filters = ds.filter().filters;
                filters = removeFilter(filters, 'oshugpz_ReportExist');
                filters = removeFilter(filters, 'oshugpz_ReportExist');
                filters = removeFilter(filters, 'oshugpz_start');
                filters = removeFilter(filters, 'oshugpz_end');
                gridData.dataSource.filter(filters);
            }
        }
    }
});


function onClick(e) { }
function buttonClickOpenConf() { $("#configurator").show(); $("#windowConf").kendoWindow({ title: "Конфигуратор", actions: ["Refresh", "Minimize", "Maximize", "Close"], width: 680 }).data("kendoWindow").center().open(); }
function buttonClickClearFilters() { var gridData = $("#gridMls").data("kendoGrid"); gridData.dataSource.filter({}); }


function removeFilter(filter, searchFor) { if (filter == null) return []; for (var x = 0; x < filter.length; x++) { if (filter[x].filters != null && filter[x].filters.length >= 0) { if (filter[x].filters.length == 0) { filter.splice(x, 1); return removeFilter(filter, searchFor); } filter[x].filters = removeFilter(filter[x].filters, searchFor); } else { if (filter[x].field == searchFor) { filter.splice(x, 1); return removeFilter(filter, searchFor); } } } return filter; }
