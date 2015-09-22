function onClick(e) {
    //if (e.id == 'ClearFilters') {
    //    var gridDataSource = $("#Grid").data("kendoGrid").dataSource;
    //    for (var i = 0; i < gridDataSource.options.fields.length - 1; i++) {
    //        gridDataSource.filter({ field: gridDataSource.options.fields[i].field, value: "" });
    //    }
    //    gridDataSource.filter([]);
    //}
    if (e.id == 'ClearFilters') { alert(e.id + " 'click' event is fired."); }
    if (e.id == 'Configurator') { $("#window").data("kendoWindow").center().open(); }
}