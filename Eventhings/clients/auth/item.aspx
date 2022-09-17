<%@ Page Title="" Language="C#" MasterPageFile="~/clients/auth/auth.Master" AutoEventWireup="true" CodeBehind="item.aspx.cs" Inherits="Eventhings.clients.auth.item" %>


<asp:Content ID="headContentContent" ContentPlaceHolderID="headContentPlaceHolder" runat="server">
</asp:Content>

<asp:Content ID="pageHeaderContent" ContentPlaceHolderID="pageHeaderContentPlaceHolder" runat="server">
    <div class="row">
        <div class="alert alert-info alert-dismissible" id="divAlert">
            <button type="button" class="close" data-dismiss="alert">&times;</button>
            <p id="lblErrorText">
            </p>
        </div>
    </div>
</asp:Content>

<asp:Content ID="bodyContent" ContentPlaceHolderID="bodyContentPlaceHolder" runat="server">
    <section class="contact-form-wrapper">
        <form action="account.aspx" method="POST" id="frmItem" runat="server">

            <div class="row">
                <ul class="nav nav-tabs mb-3" id="myTab0" role="tablist">
                    <li class="nav-item" role="presentation">
                        <button class="nav-link active" id="newcategory-tab" data-bs-toggle="tab" data-bs-target="#newcategorycontent" type="button"
                            role="tab" aria-controls="home" aria-selected="true">
                            Product Category
                        </button>
                    </li>
                    <li class="nav-item" role="presentation" style="display: none">
                        <button class="nav-link" id="newqrcode-tab" data-bs-toggle="tab" data-bs-target="#newqrcodecontent" type="button"
                            role="tab" aria-controls="home" aria-selected="true">
                            Product Unit - Measurement
                        </button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="mappedqrcode-tab" data-bs-toggle="tab" data-bs-target="#mappedqrcodecontent"
                            type="button" role="tab" aria-controls="profile" aria-selected="false">
                            New Product Entry
                        </button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="unmappedqrcode-tab" data-bs-toggle="tab" data-bs-target="#unmappedqrcodecontent"
                            type="button" role="tab" aria-controls="contact" aria-selected="false">
                            Product - Vendor Mapping
                        </button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="printqrcode-tab" data-bs-toggle="tab" data-bs-target="#printqrcodecontent"
                            type="button" role="tab" aria-controls="contact" aria-selected="false">
                            View All Products
                        </button>
                    </li>
                </ul>

                <div class="tab-content" id="myTabContent0">
                    <div class="tab-pane fade show active" id="newcategorycontent" role="tabpanel" aria-labelledby="newcategory-tab">
                        <div class="row">
                            <section class="page-header" style="padding-top: 20px; padding-bottom: 10px">
                                <h3 class="card-title">Category Setup</h3>
                            </section>

                            <div class="form-group col-md-4">
                                <label for="txtCategoryName">Name <sup>*</sup></label>
                                <input type="text" class="form-control" id="txtCategoryName" required="required" name="txtCategoryName" placeholder="Drinks">
                            </div>

                            <div class="form-group col-md-4" style="display: none">
                                <label for="cmbCategoryParent">Category Parent</label>
                                <select required="required" class="form-control multiple" id="cmbCategoryParent" name="cmbHost">
                                </select>
                            </div>

                            <div class="form-group col-md-8">
                                <label for="txtCategoryDescription">Description <sup>*</sup></label>
                                <input type="text" class="form-control" id="txtCategoryDescription" name="txtCategoryDescription" placeholder="A carbonated drinks">
                            </div>

                            <div class="form-group col-md-6">
                                <input id="chkEnableCategory" checked="checked" name="chkEnableCategory" type="checkbox" value="" />
                                <label for="chkEnableCategory">&nbsp; Enable this category by default</label>
                            </div>

                            <div class="text-right">
                                <button type="submit" id="btnSaveCategory" class="btn btn-lg btn-primary mb-4">Create Category</button>
                            </div>
                            <div class="text-center">
                                <p class="form-footer-text codetext">Category parent is used to specify the parent of the current category in context</p>
                            </div>
                        </div>
                    </div>

                    <div class="tab-pane fade" id="newqrcodecontent" role="tabpanel" aria-labelledby="newqrcode-tab" style="display: none">
                        <div class="row">
                            <section class="page-header" style="padding-top: 20px; padding-bottom: 10px">
                                <p>Product unit of measurement</p>
                            </section>

                            <div class="form-group col-md-12">
                                <label for="txtUnitName">Unit Name <sup>*</sup></label>
                                <input type="text" class="form-control" id="txtUnitName" required="required" name="txtUnitName" placeholder="Farouq Ahmed">
                            </div>

                            <div class="form-group col-md-3">
                                <input id="chkEnableUnit" checked="checked" name="chkEnableUnit" type="checkbox" value="" />
                                <label for="chkEnableUnit">&nbsp; Enable this unit by default</label>
                            </div>

                            <div class="text-right">
                                <button type="submit" id="btnSaveUnit" class="btn btn-lg btn-primary mb-4">Create Measurement Unit</button>
                            </div>
                            <div class="text-center">
                                <p class="form-footer-text codetext">You can only map a single QR code text to a single user at a time.</p>
                            </div>
                        </div>
                    </div>

                    <div class="tab-pane fade" id="mappedqrcodecontent" role="tabpanel" aria-labelledby="mappedqrcode-tab">
                        <p class="feature-title" style="margin-bottom: 10px">
                            Add new product
                        </p>
                        <div class="row">
                            <div class="form-group col-md-3">
                                <label for="txtProductName">Name <sup>*</sup></label>
                                <input type="text" class="form-control" id="txtProductName" required="required" name="txtProductName" placeholder="Eva bottle water">
                            </div>

                            <div class="form-group col-md-3">
                                <label for="txtProductDescription">Description </label>
                                <input type="text" class="form-control" id="txtProductDescription" required="required" name="txtProductDescription" placeholder="Eva distilled bottle water">
                            </div>

                            <div class="form-group col-md-3">
                                <label for="txtProductCost">Cost <sup>*</sup></label>
                                <input type="number" class="form-control" id="txtProductCost" required="required" name="txtProductCost" placeholder="150:00">
                            </div>

                            <div class="form-group col-md-3">
                                <label for="txtProductPrice">Price <sup>*</sup></label>
                                <input type="number" class="form-control" id="txtProductPrice" required="required" name="txtProductPrice" placeholder="125:00">
                            </div>

                            <div class="form-group col-md-3">
                                <label for="cmbProductCategory">Category <sup>*</sup></label>
                                <select required="required" class="form-select form-select-lg" id="cmbProductCategory" name="cmbProductCategory">
                                </select>
                            </div>

                            <div class="form-group col-md-3">
                                <label for="txtProductQuantity">Quantity <sup>*</sup></label>
                                <input type="number" min="1" class="form-control" id="txtProductQuantity" required="required" name="txtProductQuantity" placeholder="1">
                            </div>

                            <div class="form-group col-md-6">
                                <label for="txtMapPoints">Point <sup>*</sup></label>
                                <input type="number" class="form-control" id="txtMapPoints" required="required" name="txtMapPoints" placeholder="1">
                            </div>

                            <div class="form-group col-md-3">
                                <input id="chkEnableProduct" checked="checked" name="chkEnableProduct" type="checkbox" value="" />
                                <label for="chkEnableProduct">&nbsp; Enable this product by default</label>
                            </div>

                            <div class="text-right">
                                <button type="submit" id="btnSaveProduct" class="btn btn-lg btn-primary mb-4">Create Product</button>
                            </div>
                            <div class="text-center">
                                <p class="form-footer-text codetext">You can only create a single role at a time, for bulk role... request features</p>
                            </div>
                        </div>
                    </div>

                    <div class="tab-pane fade" id="unmappedqrcodecontent" role="tabpanel" aria-labelledby="unmappedqrcode-tab">
                        <p class="feature-title" style="margin-bottom: 10px">
                            Product Mapping
                        </p>

                        <div class="row">
                            <div class="form-group col-md-4">
                                <label for="cmbMapItem">Product Item<sup>*</sup></label>
                                <select required="required" class="form-select form-select-lg" id="cmbMapItem" name="cmbMapItem">
                                </select>
                            </div>

                            <div class="form-group col-md-4">
                                <label for="cmbMapItem">Vendor<sup>*</sup></label>
                                <select required="required" class="form-select form-select-lg" id="cmbVendor" name="cmbMapItem">
                                </select>
                            </div>

                             <div class="form-group col-md-4">
                                <label for="cmbEventName">Event Name<sup>*</sup></label>
                                <select required="required" class="form-select form-select-lg" id="cmbEventName" name="cmbEventName">
                                </select>
                            </div>

                            <%--<div class="form-group col-md-4" style="display:none">
                                <label for="cmbMapMeasurement">Product Measurement<sup>*</sup></label>
                                <select required="required" class="form-control" id="cmbMapMeasurement" name="cmbMapMeasurement">
                                    
                                </select>
                            </div>

                            <div class="form-group col-md-4">
                                <label for="txtProductCost"> Cost <sup>*</sup></label>
                                <input type="text" class="form-control" id="txtMapCost" required="required" name="txtMapCost" placeholder="150:00">
                            </div>

                            <div class="form-group col-md-4">
                                <label for="txtMapPrice"> Price <sup>*</sup></label>
                                <input type="text" class="form-control" id="txtMapPrice" required="required" name="txtMapPrice" placeholder="125:00">
                            </div>--%>

                            <div class="form-group col-md-3">
                                <input id="chkEnableMap" checked="checked" name="chkEnableMap" type="checkbox" value="" />
                                <label for="chkEnableMap">&nbsp; Enable this maping by default</label>
                            </div>

                            <div class="text-right">
                                <button type="submit" id="btnSaveMapping" class="btn btn-lg btn-primary mb-4">Map Product</button>
                            </div>
                            <div class="text-center">
                                <p class="form-footer-text codetext">You can only create a single role at a time, for bulk role... request features</p>
                            </div>
                        </div>
                    </div>

                    <div class="tab-pane fade" id="printqrcodecontent" role="tabpanel" aria-labelledby="printqrcode-tab">
                        <section class="page-header" style="padding-top: 20px; padding-bottom: 10px">
                            <p>Manage Product</p>
                        </section>
                        <%--<div class="form-group col-md-12">
                                <input type="text" class="form-control col-md-12" id="txtSearch2" name="txtSearch" placeholder="Search... by phone or email">
                            </div>--%>
                        <div style="max-height: 300px; overflow-y: scroll">
                            <table class="table table-striped table-bordered" id="productTable">
                                <thead>
                                    <tr>
                                        <th scope="col">
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" value="" id="mstrRoleChecked" />
                                            </div>
                                        </th>
                                        <th scope="col">S/N</th>
                                        <th scope="col">Name</th>
                                        <th scope="col">Description</th>
                                        <th scope="col">Category</th>
                                        <th scope="col">Cost</th>
                                        <th scope="col">Price</th>
                                        <th scope="col">Quantity</th>
                                        <th scope="col">Created Date</th>
                                    </tr>
                                </thead>
                                <tbody id="productTBody">
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </section>
</asp:Content>

<asp:Content ID="scriptContent" ContentPlaceHolderID="scriptContentPlaceHolder" runat="server">
    <script type="text/javascript">

        function GetParentCategory() {

            $.ajax({
                type: "POST",
                url: "/Services/category.asmx/GetCategory",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                cache: false,
                success: function (response) {

                    var responseData = (response.d !== null || response.d !== undefined) ? response.d : response;

                    //cmbProductCategory

                    $('#cmbProductCategory').empty();
                    $('#cmbProductCategory').append($("<option></option>").val('0').html('-- Choose a category --'))
                    $.each(responseData, function (i, data) {

                        //if (data.parent === 0) {
                        $('#cmbProductCategory').append($("<option></option>").val(data.id).html(data.name));
                        //}
                    });
                },
                beforeSend: function () {
                    $('#cmbProductCategory').append($("<option>Loading product categories...</option>"));
                },
                error: function (data) {
                    $("#lblErrorText").html("Error occured while submiting form");
                }
            });
        }

        function GetItems() {

            $.ajax({
                type: "POST",
                url: "/Services/items.asmx/Get",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                cache: false,
                success: function (response) {

                    var responseData = (response.d !== null || response.d !== undefined) ? response.d : response;

                    $('#cmbMapItem').empty();
                    $('#cmbMapItem').append($("<option></option>").val('0').html('-- Choose a product'));
                    $.each(responseData, function (i, data) {
                        $('#cmbMapItem').append($("<option></option>").val(data.id).html(data.name));

                    });
                },
                beforeSend: function () {
                    $('#cmbMapItem').append($("<option>Loading categories...</option>"));
                },
                error: function (data) {
                    $("#lblErrorText").html("Error occured while submiting form");
                }
            });
        }

        function GetVendors() {

            $.ajax({
                type: "POST",
                url: "/Services/vendors.asmx/Get",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                cache: false,
                success: function (response) {

                    var responseData = (response.d !== null || response.d !== undefined) ? response.d : response;

                    $('#cmbVendor').empty();
                    $('#cmbVendor').append($("<option></option>").val('0').html('-- Choose a vendor --'));
                    $.each(responseData, function (i, data) {
                        $('#cmbVendor').append($("<option></option>").val(data.id).html(data.first_name + ' ' + data.last_name));

                    });
                },
                beforeSend: function () {
                    $('#cmbVendor').append($("<option>Loading vendors...</option>"));
                },
                error: function (data) {
                    $("#lblErrorText").html("Error occured while submiting form");
                }
            });
        }

        function GetProducts() {

            $.ajax({
                type: "POST",
                url: "/Services/products.asmx/Get",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                //data: JSON.stringify(data),
                cache: false,
                success: function (response) {

                    var responseData = (response.d !== null || response.d !== undefined) ? response.d : response;
                    console.log(responseData[0].Status);
                    var status = responseData.Status;
                    if (responseData[0].Status >= '1') {

                        $('#productTBody').empty();

                        $.each(responseData, function (i, row) {
                            let rows = `<tr>
                                            <td><div class="form-check">
                                                <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault1" />
                                                </div>
                                            </td>
                                            <td>${row.id}</td> 
                                            <td>${row.name}</td> 
                                            <td>${row.description}</td>
                                            <td>${row.category}</td>
                                            <td>${row.cost}</td>
                                            <td>${row.price}</td>
                                            <td>${row.quantity}</td>
                                            <td>${(row.created_at != undefined) ? $.formattedDate(row.created_at) : " - "}</td >
                                        </tr>`;

                            $('#productTBody').append(rows);
                        });

                        //$('#productTable').DataTable();

                        $("#divAlert").addClass("alert alert-success alert-dismissible fade show").show().slideDown("slow");
                        $("#lblErrorText").html(responseData.Message);

                    }
                    else if (status == '0') {

                        $("#lblErrorText").html(responseData.Message);

                    }
                },
                error: function (data) {
                    /*$("#divAlert").addClass("alert alert-info alert-dismissible fade show").slideDown("slow");*/
                    $("#lblErrorText").html("Error occured while fetching data - Un-mapped code");
                }
            });

        }

        function GetEvents() {

            $.ajax({
                type: "POST",
                url: "/Services/events.asmx/GetAll",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                cache: false,
                success: function (response) {

                    var responseData = (response.d !== null || response.d !== undefined) ? response.d : response;

                    $('#cmbEventName').empty();
                    $('#cmbEventName').append($("<option></option>").val('0').html('-- Choose a vendor --'));
                    $.each(responseData, function (i, data) {
                        $('#cmbEventName').append($("<option></option>").val(data.id).html(data.name));

                    });
                    //$('#roleTable').DataTable();

                },
                beforeSend: function () {
                    $('#cmbEventName').append($("<option>Loading events..</option>"));
                },
                error: function (data) {
                    $("#lblErrorText").html("Error occured while submiting form");
                }
            });
        }

        $(document).ready(function () {

            $('label sup').css('color', 'red');

            GetParentCategory();
            GetItems();
            GetVendors();
            GetProducts();
            GetEvents();

            //Save new role information
            $("#btnSaveCategory").on('click', function (e) {

                e.preventDefault();

                var name = $("#txtCategoryName").val();
                var categoryParent = $("#cmbCategoryParent option:selected").val();
                var description = $("#txtCategoryDescription").val();

                if (name == '' || name.length < 1) {
                    $("#lblErrorText").html("Product category name is required"); return;
                }
                //if (categoryParent == '' || categoryParent.length < 1) {
                //    $("#lblErrorText").html("Product category parent is required"); return;
                //}
                if (description == '' || description.length < 1) {
                    $("#lblErrorText").html("Product category description is required"); return;
                }

                var catdto = {

                    name: name,
                    parent: 1,
                    description: description,
                    created_by: sessionStorage.getItem('email'),
                    active: ($('#chkEnableCategory').prop('checked') == true) ? 1 : 0
                };

                var data = {
                    catdto: catdto
                };
                console.log(data);
                $.ajax({
                    type: "POST",
                    url: "/Services/category.asmx/Save",
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    data: JSON.stringify(data),
                    success: function (response) {

                        var responseData = (response.d !== null || response.d !== undefined) ? response.d : response;
                        var status = responseData.Status;
                        if (status >= '1') {

                            $("#divAlert").addClass("alert alert-success alert-dismissible").attr('display', true).slideDown("slow");
                            $("#lblErrorText").html(responseData.Message);

                            document.getElementById('frmItem').reset();

                            GetParentCategory();
                            GetItems();

                        }
                        else if (status == '0') {
                            $("#divAlert").addClass("alert alert-info alert-dismissible fade show").attr('display', false).slideDown("slow");
                            $("#lblErrorText").html(responseData.Message);
                        }
                    },
                    beforeSend: function () {
                        $("#btnSaveCategory").attr('disabled', true);
                    },
                    complete: function () {
                        $("#btnSaveCategory").attr('disabled', false);
                    },
                    error: function (data) {
                        console.log(data);
                        //$("#divAlert").addClass("alert alert-info alert-dismissible fade show").attr('display', false).slideDown("slow");
                        $("#lblErrorText").html("Error occured while submiting form");
                    }
                });
            });

            $("#btnSaveUnit").on('click', function (e) {

                e.preventDefault();

                var name = $("#txtUnitName").val();

                if (name == '' || name.length < 1) {
                    $("#lblErrorText").html("Category unit name is required"); return;
                }

                var unitto = {

                    name: name,
                    created_by: sessionStorage.getItem('email'),
                    active: ($('#chkEnableUnit').prop('checked') == true) ? 1 : 0
                };

                var data = {
                    unitto: unitto
                };
                console.log(data);
                $.ajax({
                    type: "POST",
                    url: "/Services/unit.asmx/Save",
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    data: JSON.stringify(data),
                    success: function (response) {

                        var responseData = (response.d !== null || response.d !== undefined) ? response.d : response;
                        var status = responseData.Status;
                        if (status >= '1') {

                            //$("#divAlert").addClass("alert alert-success alert-dismissible").attr('display', true).slideDown("slow");
                            $("#lblErrorText").html(responseData.Message);

                            document.getElementById('frmItem').reset();
                        }
                        else if (status == '0') {
                            /*$("#divAlert").addClass("alert alert-info alert-dismissible fade show").attr('display', false).slideDown("slow");*/
                            $("#lblErrorText").html(responseData.Message);
                        }
                    },
                    beforeSend: function () {
                        $("#btnSaveUnit").attr('disabled', true);
                    },
                    complete: function () {
                        $("#btnSaveUnit").attr('disabled', false);
                    },
                    error: function (data) {
                        console.log(data);
                        //$("#divAlert").addClass("alert alert-info alert-dismissible fade show").attr('display', false).slideDown("slow");
                        $("#lblErrorText").html("Error occured while submiting form");
                    }
                });
            });

            $("#btnSaveProduct").on('click', function (e) {

                e.preventDefault();

                var name = $("#txtProductName").val();
                var description = $("#txtProductDescription").val();
                var cost = $("#txtProductCost").val();
                var price = $("#txtProductPrice").val();
                var category = $("#cmbProductCategory option:selected").text();
                var quantity = $("#txtProductQuantity").val();
                var point = $("#txtMapPoints").val();

                if (name == '' || name.length < 1) {
                    $("#lblErrorText").html("Product name is required"); return;
                }
                if (cost == '' || cost.length < 1) {
                    $("#lblErrorText").html("Product cost parent is required"); return;
                }
                if (price == '' || price.length < 1) {
                    $("#lblErrorText").html("Product price is required"); return;
                }
                if (point == '' || point.length < 1) {
                    $("#lblErrorText").html("Product point is required"); return;
                }
                if (category == '' || category.length < 1) {
                    $("#lblErrorText").html("Product category is required"); return;
                }
                if (quantity == '' || quantity.length < 1) {
                    $("#lblErrorText").html("Product quantity is required"); return;
                }
                if (quantity < 1) {
                    $("#lblErrorText").html("Product quantity must be greater than zero"); return;
                }
                if (cost < 1) {
                    $("#lblErrorText").html("Product cost must be greater than zero"); return;
                }
                if (price < 1) {
                    $("#lblErrorText").html("Product price must be greater than zero"); return;
                }

                var productdto = {

                    name: name,
                    description: description,
                    cost: cost,
                    price: price,
                    category: category,
                    quantity: quantity,
                    point: point,

                    created_by: sessionStorage.getItem('email'),
                    active: ($('#chkEnableProduct').prop('checked') == true) ? 1 : 0
                };

                var data = {
                    productdto: productdto
                };
                console.log(data);
                $.ajax({
                    type: "POST",
                    url: "/Services/products.asmx/Save",
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    data: JSON.stringify(data),
                    success: function (response) {

                        var responseData = (response.d !== null || response.d !== undefined) ? response.d : response;
                        var status = responseData.Status;
                        if (status >= '1') {

                            //$("#divAlert").addClass("alert alert-success alert-dismissible").attr('display', true).slideDown("slow");
                            $("#lblErrorText").html(responseData.Message);

                            document.getElementById('frmItem').reset();
                            GetProducts();

                        }
                        else if (status == '0') {
                            $("#divAlert").addClass("alert alert-info alert-dismissible fade show").attr('display', false).slideDown("slow");
                            $("#lblErrorText").html(responseData.Message);
                        }
                    },
                    beforeSend: function () {
                        $("#btnSaveProduct").attr('disabled', true);
                    },
                    complete: function () {
                        $("#btnSaveProduct").attr('disabled', false);
                    },
                    error: function (data) {
                        $("#lblErrorText").html("Error occured while submiting form");
                    }
                });
            });

            $("#btnSaveMapping").on('click', function (e) {

                e.preventDefault();

                var itemid = $("#cmbMapItem option:selected").val();
                var vendorid = $("#cmbVendor option:selected").val();
                var eventid = $("#cmbEventName option:selected").val();

                if (itemid == '' || itemid.length < 1) {
                    $("#lblErrorText").html("Product name is required"); return;
                }
                if (vendorid == '' || vendorid.length < 1) {
                    $("#lblErrorText").html("Vendor name is required"); return;
                }
                if (eventid == '' || vendorid.length < 1) {
                    $("#lblErrorText").html("Event name is required"); return;
                }

                var mapdto = {

                    item_id: itemid,
                    vendor_id: vendorid,
                    event_id: eventid,
                    created_by: sessionStorage.getItem('email'),
                    active: ($('#chkEnableMap').prop('checked') == true) ? 1 : 0
                };

                var data = {
                    mapdto: mapdto
                };
                console.log(data);
                $.ajax({
                    type: "POST",
                    url: "/Services/mapping.asmx/Save",
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    data: JSON.stringify(data),
                    success: function (response) {

                        var responseData = (response.d !== null || response.d !== undefined) ? response.d : response;
                        var status = responseData.Status;
                        if (status >= '1') {

                            $("#lblErrorText").html(responseData.Message);

                        }
                        else if (status == '0') {
                            $("#divAlert").addClass("alert alert-info alert-dismissible fade show").attr('display', false).slideDown("slow");
                            $("#lblErrorText").html(responseData.Message);
                        }
                    },
                    beforeSend: function () {
                        $("#btnSaveMapping").attr('disabled', true);
                    },
                    complete: function () {
                        $("#btnSaveMapping").attr('disabled', false);
                    },
                    error: function (data) {
                        $("#lblErrorText").html("Error occured while submiting form");
                    }
                });
            });
        });
    </script>
</asp:Content>
