<%@ Page Title="" Language="C#" MasterPageFile="~/admin/site.Master" AutoEventWireup="true" CodeBehind="qrcodegen.aspx.cs" Inherits="Eventhings.admin.qrcodegen" %>

<asp:Content ID="headContent" ContentPlaceHolderID="headContentPlaceHolder" runat="server">
</asp:Content>

<asp:Content ID="mainContent" ContentPlaceHolderID="mainContentPlaceHolder" runat="server">
    <form action="qrcodegen.aspx" method="post" runat="server" id="frmQrcodeGen" style="padding-top:50px">
        <div class="content">

            <div class="content">
                <div class="page-content-wrapper ">
                    <div class="container">

                        <div class="row">
                            <div class="col-md-12">
                                <div class="panel panel-primary">
                                    <div class="panel-body m-b-20">
                                        <h4 class="m-b-30 m-t-0">Generate New Qr Code</h4>
                                        <div class="pull-right m-l-10">
                                            <button type="button" class="btn btn-success" data-toggle="modal" data-target="#custom-width-modal">Add New</button>
                                            <%--<button type="button"  class="btn btn-primary" onclick="printContent('myTable')">Print</button>--%>
                                        </div>

                                        <div class="row">
                                            <div id="myTable" class="col-md-12">
                                                <div class="panel panel-primary">
                                                    <div class="panel-body">

                                                        <div class="row">
                                                            <div id="divbody">
                                                                <%--<div class="col-md-2"></div>--%>
                                                            </div>
                                                        </div>

                                                        <%--<table id="datatable-buttonsxx" class="table table-striped table-bordered">
                                                            <thead>
                                                                <tr>
                                                                    <th>S/N</th>
                                                                    <th></th>
                                                                    <th></th>
                                                                    <th></th>
                                                                    <th></th>
                                                                    <th></th>
                                                                </tr>
                                                            </thead>

                                                            <tbody id="tbody">--%>

                                                                <%--<% 
                                                                    var coll = _million; //GetRandomGuid(10);
                                                                    if (coll.Count >= 1)
                                                                    {
                                                                        foreach (var s in coll)
                                                                        {
                                                                 %>
                                                                <tr>
                                                                    <td><%: s.id %></td>
                                                                    <td><%: s.batch_number %></td>
                                                                    <td><%: s.batcg_name %></td>
                                                                    <td><%: (s.active == 1) ? "Is Active" : "Not Active" %></td>
                                                                    <td><%: s.code %></td>
                                                                    <td><canvas height="53" width="53"  id="canv<%:s.id%>|<%:s.code %>"></canvas></td>
                                                                </tr>

                                                                <%}}%>--%>

                                                           <%-- </tbody>
                                                        </table>--%>

                                                    </div>
                                                </div>
                                            </div>

                                        </div>

                                    </div>
                                </div>
                            </div>

                        </div>

                    </div>
                </div>
            </div>

        </div>
        <!-- content -->

        <!-- modal -->
        <div class="col-xs-6 col-sm-3 m-t-30 m-b-15">
            <div id="custom-width-modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="custom-width-modalLabel" aria-hidden="true" style="display: none">
                <div class="modal-dialog" style="width: 55%">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                            <h4 class="modal-title" id="custom-width-modalLabel">Generate New Qr Code</h4>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="form-group col-md-12">
                                    <div class="alert alert-danger alert-dismissible" id="divAlert">
                                        <button type="button" class="close" data-dismiss="alert">&times;</button>
                                        <p id="lblErrorText">
                                            <strong>Error!</strong> Indicates a successful or positive action.
                                   
                                        </p>
                                    </div>
                                </div>
                                <div class="form-group col-md-6">
                                    <label>Batch Number</label>
                                    <input type="text" class="form-control" runat="server" id="txtBatchNumber" readonly="readonly" required="required" placeholder="QC-336726373" />
                                </div>
                                <div class="form-group col-md-6">
                                    <label>Batch Name</label>
                                    <input type="text" class="form-control" runat="server" id="txtBatcgName"  required="required" placeholder="Spring 2021" />
                                </div>
                                <div class="form-group col-md-12">
                                    <label class="control-label">Code Count</label>
                                    <input type="number" class="form-control" runat="server" id="txtCodeCount" max="50" min="1" required="required" placeholder="Monkwo" />
                                </div>
                                <div class="form-group col-md-4">
                                    <input id="chkActive" runat="server" checked="checked" type="checkbox" data-parsley-multiple="groups" data-parsley-mincheck="2" value="" />
                                    <label for="checkbox1">Set generated code to active</label>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default waves-effect" data-dismiss="modal">Close</button>
                            <button type="submit" runat="server" id="btnGenerateCode" onserverclick="btnGenerateCode_ServerClick"  class="btn btn-primary waves-effect waves-light">Generate Code</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</asp:Content>

<asp:Content ID="scriptContent" ContentPlaceHolderID="scriptContentPlaceHolder" runat="server">

    <script src="https://cdnjs.cloudflare.com/ajax/libs/qrious/4.0.2/qrious.min.js"></script>

    <script type="text/javascript">
        var qr;

        $(document).ready(function () {

            $("#divAlert").hide();

            var data = {
                activestatus: 1
            };

            $.ajax({
                type: "POST",
                url: "qrcodegen.aspx/ActiveQrCode",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify(data),
                success: function (response) {

                    var responseData = (response.d !== null || response.d !== undefined) ? response.d : response;

                    //parse the response as json data;
                    responseData = JSON.parse(responseData);
                    var tr = '';

                    $.each(responseData, function (i, item) {

                        console.log(item);

                        /*tr += '<tr><td>' + item.code + '</td>' + '<td><canvas onload=' + generateQRCode("canv" + i, item) + 'id=canv' + i + '></canvas></td> </tr>';*/

                        console.log(item.code);

                        //tr += '<tr><td>' + item.id + '</td><td><canvas id=' + item.id + '|' + item.code + '></canvas></td></tr>';
                        tr += '<div class="col-md-2"><canvas id=' + item.id + '|' + item.code + '></canvas></div > ';
                    });

                    $("#divbody").append(tr)

                    //$("#tbody").append(tr);

                    var can = document.getElementsByTagName('canvas');

                    var idx = '';
                    var splitid = '';

                    for ( x = 0; x <= can.length; x++) {

                        idx = can[x].id;
                        splitid = idx.split('|')[1];

                        qr = new QRious({
                            element: can[x],
                            size: 53,
                            value: 'https://localhost:44329/admin/codelink.aspx?code=' + splitid,
                            foreground: 'black'
                        });
                    }
                },
                error: function (data) {
                    console.log(data);
                    $("#divAlert").addClass("alert alert-danger alert-dismissible fade show").slideDown("slow");
                    $("#lblErrorText").html("Error occured while submiting form");
                    /*console.error(data);*/
                }
            });
        });

        /*element: document.getElementById('canv3'),*/
        function printContent(hits) {
            var printcontent = document.getElementById(hits).innerHTML;
            var restorepage = document.body.innerHTML;
            document.body.innerHTML = printcontent;
            window.print();
            document.body.innerHTML = restorepage;
        }

        (function () {

            //$("#divAlert").hide();

            //var can = document.getElementsByTagName('canvas');

            //var id;
            //var splitid;

            //for (x = 0; x <= can.length; x++) {

            //    id = can[x].id;
            //    splitid = id.split('|')[1];

            //    qr = new QRious({
            //        element: can[x],
            //        size: 53,
            //        value: 'https://localhost:44329/admin/codelink.aspx?code=' + splitid,
            //        foreground: 'black',
            //    });

            //}

        })();

        function generateQRCode(id, qrtext) {
            //var qrtext = document.getElementById("qr-text").value;
            //document.getElementById("qr-result").innerHTML = "QR code for " + qrtext + ":";
            //alert(qrtext);
            var qq = new QRious({
                element: document.getElementById(id),
                size: 53,
                value: 'https://localhost:44329/admin/codelink.aspx?code=' + qrtext,
                foreground: 'black',
            });
        }
    </script>
</asp:Content>
