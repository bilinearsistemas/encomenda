"use strict";
(function () {
	//var $parameters = $("#parameters");
	//$parameters.odwParameters("init");

	var data = {};
	
	function beforeCreate (vm) {
		$(vm.$options.el).find('[name]').each(function() {
			var $input = $(this);
			var name = $input.attr('name');
			
			data[name] = $input.val();
			$input.attr('v-model', name);
			$input.addClass('form-control');
		});
	}
	
	new Vue({
		el: "#parameters",
		data: data,
		beforeCreate: function () {
			beforeCreate(this);
		},
		mounted: function () {		
			var vc = this, $vc = $(vc.$el);
			
			// Initialize date fields
			$vc.find('input[odw-type="date"]').each(function() {
				var $input = $(this);
				if ($.datepicker) {
					$input.datetimepicker({
						format: "DD/MM/YYYY"
					})
					.on('dp.change', function () {
						vc[$input.attr('name')] = $input.val();
					});
				}
			});	
			// Initialize date fields
			$vc.find('input[odw-type="date"]').each(function() {
				var $input = $(this);
				if ($.datepicker) {
					$input.datetimepicker({
						format: "DD/MM/YYYY"
					})
					.on('dp.change', function () {
						vc[$input.attr('name')] = $input.val();
					});
				}
			});	

		},
		created: function() {
			 this.$on('updateselection', function(value){
                console.log(value);
            });
		}
	});	
})();

/*
jQuery.fn.extend({
	odwParameters: function (method, args) {
		var $this = this;
		var odw3 = {
			init: function () {
				return $this.each(function () {
					
					// Initialize date fields
					if ($.datepicker) {
						$(this).find('input[odw-type="date"]').each(function() {
							var $this = $(this);
							var name = $this.attr('name');
							
							parameters[name] = $this.attr('value');
							$this.attr('v-model', 'parameters.' + name);
							$this.attr('v-bind:value', 'parameters.' + name);
							$this.addClass('form-control');
							$this.datepicker();
						});						
					}					
				});
			},
			attr: function (attr, val) {
				return $(this).attr("odw-" + attr, val);
			}
		};
		
		if (!odw3[method]) {
			throw "Invalid method: " + method;
		}
		
		return odw3[method]();
	}
});
*/