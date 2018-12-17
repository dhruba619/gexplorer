$(document)
		.ready(
				function() {
					var formdata = {
						"grant_type" : "password",
						"username" : "admin",
						"password" : "admin1234",
						"client_id" : "spring-security-oauth2-read-write-client"
					}
					$.ajax(
									{
										xhrFields : {
											withCredentials : true
										},
										headers : {
											'Authorization' : 'Basic '
													+ btoa('spring-security-oauth2-read-write-client:spring-security-oauth2-read-write-client-password1234')
										},
										type : "POST",
										url : '/oauth/token',
										data : formdata
									}).then(
									function(data) {
										localStorage.setItem("access_token",
												data.access_token);

									});

				});


function getAccessToken() {
	return localStorage.getItem("access_token");
}


function clearPersonForm() {
	$("#person_key").val(''),
	$("#person_name").val(''),
    $("#person_motherid").val(''),
	$("#person_fatherid").val(''),
	$("#person_dob").val(''),
	$("#person_gender").val('')
}

function showHome() {
	$("#person_search_grid").hide();
	$("#person_add_grid").hide();
	$("#person_children_grid").hide();
	$("#person_ancestors_grid").hide();
	$("#person_home_grid").show();
	
	$("#person_home_menu_id").addClass("active");
	$("#person_add_menu_id").removeClass("active");
	$("#person_search_menu_id").removeClass("active");
	$("#person_ancestor_menu_id").removeClass("active");
	$("#person_children_menu_id").removeClass("active");
}

function showAddForm(){
	$("#person_home_grid").hide();
	$("#person_search_grid").hide();
	$("#person_children_grid").hide();
	$("#person_ancestors_grid").hide();
	$("#person_add_grid").show();
	
	$("#person_home_menu_id").removeClass("active");
	$("#person_add_menu_id").addClass("active");
	$("#person_search_menu_id").removeClass("active");
	$("#person_ancestor_menu_id").removeClass("active");
	$("#person_children_menu_id").removeClass("active");
};
function showSearchForm(){
	$("#person_home_grid").hide();
	$("#person_add_grid").hide();
	$("#person_children_grid").hide();
	$("#person_ancestors_grid").hide();
	$("#person_search_grid").show();
	
	$("#person_home_menu_id").removeClass("active");
	$("#person_add_menu_id").removeClass("active");
	$("#person_search_menu_id").addClass("active");
	$("#person_ancestor_menu_id").removeClass("active");
	$("#person_children_menu_id").removeClass("active");
}

function showChildren(){
	$("#person_home_grid").hide();
	$("#person_add_grid").hide();
	$("#person_search_grid").hide();
	$("#person_ancestors_grid").hide();
	$("#person_children_grid").show();
	
	$("#person_home_menu_id").removeClass("active");
	$("#person_add_menu_id").removeClass("active");
	$("#person_search_menu_id").removeClass("active");
	$("#person_ancestor_menu_id").removeClass("active");
	$("#person_children_menu_id").addClass("active");
}

function showAncestor(){
	$("#person_home_grid").hide();
	$("#person_add_grid").hide();
	$("#person_search_grid").hide();
	$("#person_children_grid").hide();
	$("#person_ancestors_grid").show();
	
	$("#person_home_menu_id").removeClass("active");
	$("#person_add_menu_id").removeClass("active");
	$("#person_search_menu_id").removeClass("active");
	$("#person_ancestor_menu_id").addClass("active");
	$("#person_children_menu_id").removeClass("active");
}

/**
 * Method to add person into the database using Jquery AJAX call
 * 
 * @param event
 * @returns
 */
function addPerson(event) {
	$("#add_person_result").html('');
	event.preventDefault();
	event.stopPropagation();
	var json = {
		key : $("#person_key").val(),
		name : $("#person_name").val(),
		m : $("#person_motherid").val(),
		f : $("#person_fatherid").val(),
		gender: $("#person_gender").val(),
		dob : $("#person_dob").val().replace('-','').replace('-',''),
		
	}
	$.ajax(
			{
				headers : {
					'authorization' : 'Bearer '
							+ getAccessToken(),
					'Content-Type' : 'application/json'		
				},
				type : "POST",
				url : '/GE/person/addJson',
				data: JSON.stringify(json),
				dataType: "json",
				contentType: 'application/json; charset=utf-8'
			}).then(
			function(data) {
				if(data.result) {
					$("#add_person_result").html("Person added successfully");
				}
				else {
					$("#add_person_result").html("ERROR: "+ data.message);
				}
				

			}).catch(function(error){
				$("#add_person_result").html("ERROR: "+ error.message);
			});
	
	
	clearPersonForm();
	return false;
}

function editPerson(event) {
	$("#person_edit_result").html('');
	event.preventDefault();
	event.stopPropagation();
	var json = {
		key : $("#edit_person_key").val(),
		name : $("#edit_person_name").val(),
		m : $("#edit_person_motherid").val(),
		f : $("#edit_person_fatherid").val(),
		gender: $("#edit_person_gender").val(),
		dob : $("#edit_person_dob").val().replace('-','').replace('-',''),
		
	}
	$.ajax(
			{
				headers : {
					'authorization' : 'Bearer '
							+ getAccessToken(),
					'Content-Type' : 'application/json'		
				},
				type : "POST",
				url : '/GE/person/edit/'+$("#edit_person_key").val(),
				data: JSON.stringify(json),
				dataType: "json",
				contentType: 'application/json; charset=utf-8'
			}).then(
			function(data) {
				if(data.result) {
					$("#person_edit_result").html("Person update successfully");
				}
				else {
					$("#person_edit_result").html("ERROR: "+ data.message);
				}
				

			}).catch(function(error){
				$("#person_edit_result").html("ERROR: "+ JSON.stringify(error));
			});
	
	
	clearPersonForm();
	return false;
}

function searchPerson(event) {
	var key = $("#search_person_key").val()
	$.ajax(
			{
				headers : {
					'authorization' : 'Bearer '
							+ getAccessToken(),
					'Content-Type' : 'application/json'		
				},
				type : "GET",
				url : '/GE/person/get/'+key
			}).then(
			function(data) {
				$("#search_person_result").html('');
				console.log(data);
				$("#edit_person_key").val(data.key);
				$("#edit_person_name").val(data.name);
			    $("#edit_person_motherid").val(data.m);
				$("#edit_person_fatherid").val(data.f);
				var dob = data.dob;
				console.log(dob);
				var ddob = dob.toString();
				console.log(ddob);
				var date = ddob.substring(0,4)+"-"+ddob.substring(4,6)+"-"+ddob.substring(6)
				console.log(date);
				$("#edit_person_dob").val(date)
				$("#edit_person_gender").val(data.gender)

			}).catch(function(error){
				$("#search_person_result").html("ERROR: "+ JSON.stringify(error));
			});
	event.stopPropagation();
	event.preventDefault();
	return false;
}



function deletePerson(event) {
	var key =$("#search_person_key").val();
	$.ajax({
		headers : {
					'authorization' : 'Bearer '
							+ getAccessToken(),
					'Content-Type' : 'application/json'		
				},
				type : "GET",
				url : '/GE/person/delete/'+key
	}).then(
			function(data) {
				console.log(data);
				$("#edit_person_key").val(''),
				$("#edit_person_name").val(''),
			    $("#edit_person_motherid").val(''),
				$("#edit_person_fatherid").val(''),
				$("#edit_person_dob").val('')
				$("#edit_person_gender").val('')

			}).catch(function(error){
				$("#search_person_result").html("ERROR: "+ JSON.stringify(error));
			});
	$("#search_person_key").val('');
}


function searchAncestors(event) {
	event.stopPropagation();
	event.preventDefault();
	$("#search_ancestors_result").html('');
	var key = $("#search_ancestor_key").val();
	$.ajax({
		headers : {
					'authorization' : 'Bearer '
							+ getAccessToken(),
					'Content-Type' : 'application/json'		
				},
				type : "GET",
				url : '/GE/person/ancestors/'+key
	}).then(
			function(data) {
				console.log(data);
				$("#search_ancestors_result").html(renderjson(data));

			}).catch(function(error){
				$("#search_ancestors_result").html("ERROR: "+ JSON.stringify(error));
			});
	$("#search_person_key").val('');
	
}

function searchChildren(event) {
	event.stopPropagation();
	event.preventDefault();
	$("#search_children_result").html('');
	var key = $("#search_children_key").val();
	$.ajax({
		headers : {
					'authorization' : 'Bearer '
							+ getAccessToken(),
					'Content-Type' : 'application/json'		
				},
				type : "GET",
				url : '/GE/person/descendants/'+key
	}).then(
			function(data) {
				console.log(data);
				$("#search_children_result").html(renderjson(data));

			}).catch(function(error){
				$("#search_children_result").html("ERROR: "+ JSON.stringify(error));
			});
	$("#search_person_key").val('');
}