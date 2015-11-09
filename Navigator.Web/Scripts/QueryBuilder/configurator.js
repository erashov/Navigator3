$('#builder').queryBuilder({
    filters: [{
        id: 'NumML',
        field: 'NumML',
        label: '№ МЛ',
        type: 'integer'
        , operators: ['equal']
    }, {
        id: 'category',
        field: 'category',
        label: 'Category',
        type: 'integer',
        input: 'select',
        values: {
            1: 'Books',
            2: 'Movies',
            3: 'Music',
            4: 'Tools',
            5: 'Goodies',
            6: 'Clothes'
        },
        operators: ['equal', 'not_equal', 'in', 'not_in', 'is_null', 'is_not_null']
    }, {
        id: 'in_stock',
        field: 'in_stock',
        label: 'In stock',
        type: 'integer',
        input: 'radio',
        values: {
            1: 'Yes',
            0: 'No',
            2: 'Maybe'
        },
        operators: ['equal']
    }, {
        id: 'price',
        field: 'price',
        label: 'Price',
        type: 'double',
        validation: {
            min: 0,
            step: 0.01
        }
    }, {
        id: 'id',
        field: 'id',
        label: 'Identifier',
        type: 'string',
        placeholder: '____-____-____',
        operators: ['equal', 'not_equal'],
        validation: {
            format: /^.{4}-.{4}-.{4}$/
        }
    }],
});

function Save() {
    var grid = $("#gridMls").data("kendoGrid");
    var filters = $('#builder').queryBuilder('getRules');
    var ds = grid.dataSource;

    //alert(filters);
    ds.filter(filters);


}