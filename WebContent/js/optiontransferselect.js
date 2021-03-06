function moveSelectedOptions(objSourceElement, objTargetElement, toSort, notMove1, notMove2) {
    var test1 = compile(notMove1);
    var test2 = compile(notMove2);
    moveOptions(objSourceElement, objTargetElement, toSort, 
        function(opt) {
            return (opt.selected && !test1(opt.value) && !test2(opt.value));
        }
    );
}

function removeSelectedOptions(objSourceElement) {
	$(objSourceElement).find('option:selected').remove();
}

function removeAllOptions(objSourceElement) {
	$(objSourceElement).find('option').remove();
}

function moveText(objSourceElement, objTargetElement) {
	var intTargetLen = objTargetElement.length++;
    objTargetElement.options[intTargetLen].text =objSourceElement.value;
    objTargetElement.options[intTargetLen].value =0;
    objSourceElement.value = '';
}

function moveAllOptions(objSourceElement, objTargetElement, toSort, notMove1, notMove2) {
    var test1 = compile(notMove1);
    var test2 = compile(notMove2);
    moveOptions(objSourceElement, objTargetElement, toSort, 
        function(opt) {
            return (!test1(opt.value) && !test2(opt.value));
        }
    );
}

function compile(ptn) {
    if (ptn != undefined) {
    	if (ptn == '' || !window.RegExp) {
            return function(val) { return val == ptn; }
        } else {
            var reg = new RegExp(ptn);
            return function (val) { 
                if (val == '') { // ignore empty option added by template 
                	return true;
                }
            	return reg.test(val); }
        }
    }
    return function(val) { return false; }
}    

function moveOptions(objSourceElement, objTargetElement, toSort, chooseFunc) {
    var aryTempSourceOptions = new Array();
    var aryTempTargetOptions = new Array();
    var x = 0;

    //looping through source element to find selected options
    for (var i = 0; i < objSourceElement.length; i++) {
        if (chooseFunc(objSourceElement.options[i])) {
            //need to move this option to target element
            var intTargetLen = objTargetElement.length++;
            objTargetElement.options[intTargetLen].text =   objSourceElement.options[i].text;
            objTargetElement.options[intTargetLen].value =  objSourceElement.options[i].value;
        }
        else {
            //storing options that stay to recreate select element
            var objTempValues = new Object();
            objTempValues.text = objSourceElement.options[i].text;
            objTempValues.value = objSourceElement.options[i].value;
            aryTempSourceOptions[x] = objTempValues;
            x++;
        }
    }

    //sorting and refilling target list
    for (var i = 0; i < objTargetElement.length; i++) {
        var objTempValues = new Object();
        objTempValues.text = objTargetElement.options[i].text;
        objTempValues.value = objTargetElement.options[i].value;
        aryTempTargetOptions[i] = objTempValues;
    }
    
    if (toSort) {
        aryTempTargetOptions.sort(sortByText);
    }    
    
    for (var i = 0; i < objTargetElement.length; i++) {
        objTargetElement.options[i].text = aryTempTargetOptions[i].text;
        objTargetElement.options[i].value = aryTempTargetOptions[i].value;
        objTargetElement.options[i].selected = false;
    }   
    
    //resetting length of source
    objSourceElement.length = aryTempSourceOptions.length;
    //looping through temp array to recreate source select element
    for (var i = 0; i < aryTempSourceOptions.length; i++) {
        objSourceElement.options[i].text = aryTempSourceOptions[i].text;
        objSourceElement.options[i].value = aryTempSourceOptions[i].value;
        objSourceElement.options[i].selected = false;
    }
}

function sortByText(a, b) {
    if (a.text.toLowerCase() < b.text.toLowerCase()) {return -1}
    if (a.text.toLowerCase() > b.text.toLowerCase()) {return 1}
    return 0;
}

function selectAllOptionsExceptSome(objTargetElement, type, ptn) {
    var test = compile(ptn);
    for (var i = 0; i < objTargetElement.length; i++) {
        var opt = objTargetElement.options[i];
        if ((type == 'key' && !test(opt.value)) ||
              (type == 'text' && !test(opt.text))) {
            opt.selected = true;
        } else {
            opt.selected = false;
        }    
    }
    return false;
}

function selectAllOptions(objTargetElement) {
    for (var i = 0; i < objTargetElement.length; i++) {
        if (objTargetElement.options[i].value != '') {
            objTargetElement.options[i].selected = true;    
        }    
    }
    return false;
}

function moveOptionUp(objTargetElement, type, ptn) {
	var test = compile(ptn);
	for (i=0; i<objTargetElement.length; i++) {
		if (objTargetElement[i].selected) {
			var v;
			if (i != 0 && !objTargetElement[i-1].selected) {
		    	if (type == 'key') {
		    		v = objTargetElement[i-1].value
		    	}
		    	else {
		    		v = objTargetElement[i-1].text;
		    	}
				if (!test(v)) {
					swapOptions(objTargetElement,i,i-1);
				}
		    }
		}
	}
}

function moveOptionDown(objTargetElement, type, ptn) {
	var test = compile(ptn);
	for (i=(objTargetElement.length-1); i>= 0; i--) {
		if (objTargetElement[i].selected) {
			var v;
			if ((i != (objTargetElement.length-1)) && !objTargetElement[i+1].selected) {
		    	if (type == 'key') {
		    		v = objTargetElement[i].value
		    	}
		    	else {
		    		v = objTargetElement[i].text;
		    	}
				if (!test(v)) {
					swapOptions(objTargetElement,i,i+1);
				}
		    }
		}
	}
}

function swapOptions(objTargetElement, first, second) {
	var opt = objTargetElement.options;
	var temp = new Option(opt[first].text, opt[first].value, opt[first].defaultSelected, opt[first].selected);
	var temp2= new Option(opt[second].text, opt[second].value, opt[second].defaultSelected, opt[second].selected);
	opt[first] = temp2;
	opt[second] = temp;
}
