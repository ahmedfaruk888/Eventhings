<%@ Page Title="" Language="C#" MasterPageFile="~/clients/auth/auth.Master" AutoEventWireup="true" CodeBehind="print.aspx.cs" Inherits="Eventhings.clients.auth.print" %>

<asp:Content ID="headContent" ContentPlaceHolderID="headContentPlaceHolder" runat="server">
    <style type="text/css">
        @media print {
          div {
            break-inside: avoid;
          }
          canvas {
            break-inside: avoid;
          }
        }
    </style>
</asp:Content>

<asp:Content ID="pageHeaderContent" ContentPlaceHolderID="pageHeaderContentPlaceHolder" runat="server">
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="menuContentplaceHolder" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="footerContentPlaceHolder" runat="server">
</asp:Content>

<asp:Content ID="bodyContent" ContentPlaceHolderID="bodyContentPlaceHolder" runat="server">
    <div>
        <div class="row" id="print">

        </div>
    </div>
</asp:Content>

<asp:Content ID="scriptContent" ContentPlaceHolderID="scriptContentPlaceHolder" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {

            $('#print').html(sessionStorage.getItem('cc'));

            //const batch = new URLSearchParams(window.location.href).get('batch');
            //let batch = window.location.href.split('?')[1].split('=')[1];

            //batch = decodeURI(batch);

            //var data = {

            //    batchname: batch
            //};


            //window.location.href = "/clients/auth/qrcode.aspx?batch=" + ;

            //$.ajax({
            //    type: "POST",
            //    url: "/Services/qrcode.asmx/GenerteQRCodeImage",
            //    dataType: "json",
            //    contentType: "application/json; charset=utf-8",
            //    data: JSON.stringify(data),
            //    cache: false,
            //    success: function (response) {

            //        //response data is an array or collection
            //        var responseData = (response.d !== null || response.d !== undefined) ? response.d : response;

            //        var can = document.getElementsByTagName('canvas');

            //        if (responseData.length > 0) {
            //            var msg = [];

            //            $.each(responseData, function (i, row) {

            //                for (x = 0; x <= can.length; x++) {

            //                    //idx = can[x].id;
            //                    qr = new QRious({
            //                        element: can[x],
            //                        size: 106,
            //                        value: responseData[i].Message,
            //                        foreground: 'black'
            //                    });
            //               }
            //            });
            //        }

            //        /*$("#lblErrorText").html(responseData[i].Message);*/
            //    },
            //    error: function (data) {
            //        $("#lblErrorText").html("Error occured while submiting form");
            //    }
            //});


            var can = document.getElementsByTagName('canvas');

            var idx = '';
            var splitid = '';

            for (x = 0; x <= can.length; x++) {

                idx = can[x].id;
                splitid = idx.split('|')[1];

                qr = new QRious({
                    element: can[x],
                    size: 106,
                    value: 'https://www.eventiix.com/clients/auth/codelink.aspx?code=' + splitid,
                    foreground: 'black'
                });
            }

        });
    </script>
</asp:Content>
