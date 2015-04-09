var Test = function () {

    // private functions & variables

    var myFunc = function(text) {
        alert(name);
    }
    var name="";
    // public functions
    return {

        //main function
        init: function (n) {
            //initialize here something.   
        	name = n;
        },

        //some helper function
        doSomeStuff: function () {
            myFunc();
        }

    };

};