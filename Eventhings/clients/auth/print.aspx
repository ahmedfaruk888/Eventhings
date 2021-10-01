<%@ Page Title="" Language="C#" MasterPageFile="~/clients/auth/auth.Master" AutoEventWireup="true" CodeBehind="print.aspx.cs" Inherits="Eventhings.clients.auth.print" %>

<asp:Content ID="headContent" ContentPlaceHolderID="headContentPlaceHolder" runat="server">

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
            //$('#print').append($('#divQrCardBody').html());


            var can = document.getElementsByTagName('canvas');

            var idx = '';
            var splitid = '';

            for (x = 0; x <= can.length; x++) {

                idx = can[x].id;
                splitid = idx.split('|')[1];

                qr = new QRious({
                    element: can[x],
                    size: 106,
                    value: 'https://localhost:44329/clients/auth/codelink.aspx?code=' + splitid,
                    foreground: 'black'
                });
            }

        });
    </script>
</asp:Content>
