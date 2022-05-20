<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Producto_Editar.aspx.cs" Inherits="Tienda.Producto_Editar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <h2>Editar Producto</h2>
    <fieldset>
        <legend>Datos del Producto</legend>
        <label for="txtNombre">Nombre:</label>
        <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>

        <label for="txtMarca">Marca:</label>
        <asp:TextBox ID="txtMarca" runat="server"></asp:TextBox>

        <label for="txtPrecio">Precio:</label>
        <asp:TextBox id="txtPrecio" runat="server"></asp:TextBox>

        <label for="txtObservación">Observacion</label>
        <asp:TextBox ID="txtObservacion" runat="server" TextMode="MultiLine"></asp:TextBox>
    </fieldset>
    <asp:Button ID="btnActualizar" class="boton" runat="server" Text="Actualizar" OnClick="actualizar"/>
</asp:Content>
