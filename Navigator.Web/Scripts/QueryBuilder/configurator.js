$('#builderConf').queryBuilder({
    filters: [{
        id: 'NumML',
        label: '№ МЛ',
        type: 'integer'
    }, {
        id: 'Zakazhcik',
        label: 'Заказчик',
        type: 'string'
    },
     {
         id: 'Otvetstv',
         label: 'Ответственный',
         type: 'string'
     },
     {
         id: 'AdresA',
         label: 'Адрес',
         type: 'string'
     },
     {
         id: 'AdressA',
         label: 'Адрес СО',
         type: 'string'
     },
     {
         id: 'gplr_ReportExist',
         label: 'ГПЛР',
         type: 'integer',
         input: 'select',
         values: { 1: 'Выдано', 2: 'Не выдано', 3: 'Выполнено' }, operators: ['equal']
     },
     {
        id: 'dmv_ReportExist',
        label: 'ДМВ',
        type: 'integer',
        input: 'select',
        values: { 1: 'Выдано', 2: 'Не выдано', 3: 'Выполнено' }, operators: ['equal']
    }],
});
function Save() {
    var result = $('#builderConf').queryBuilder('getRules');
    if (!$.isEmptyObject(result)) {
        var result = renameProperties(result, { rules: 'filters', condition: 'logic' });
        alert(kendo.stringify($("#gridMls").data("kendoGrid").getOptions()));
        //        var query = JSON.stringify(result, null, 2);
        $("#gridMls").data("kendoGrid").dataSource.filter(result);;
    }
}

function renameProperties(sourceObj, replaceList, destObj) { destObj = destObj || {}; $.each(sourceObj, function (key) { if (sourceObj.hasOwnProperty(key)) { if (sourceObj[key] instanceof Array) { if (replaceList[key]) { var newName = replaceList[key]; destObj[newName] = []; renameProperties(sourceObj[key], replaceList, destObj[newName]); } else if (!replaceList[key]) { destObj[key] = []; renameProperties(sourceObj[key], replaceList, destObj[key]); } } else if (typeof sourceObj[key] === 'object') { if (replaceList[key]) { var newName = replaceList[key]; destObj[newName] = {}; renameProperties(sourceObj[key], replaceList, destObj[newName]); } else if (!replaceList[key]) { destObj[key] = {}; renameProperties(sourceObj[key], replaceList, destObj[key]); } } else { if (replaceList[key]) { var newName = replaceList[key]; destObj[newName] = sourceObj[key]; } else if (!replaceList[key]) { destObj[key] = sourceObj[key]; } } } }); return destObj; }