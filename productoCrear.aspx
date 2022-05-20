<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="productoCrear.aspx.cs" Inherits="Tienda.productoCrear" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <h2>Nuevo Producto</h2>
     <a href="productoCrear.aspx" class="boton">
        <i class="fa-solid fa-square-arrow-left"></i>
        Regresar
    </a>
    <fieldset>
        <legend>Datos del Producto</legend>

        <label for="txtNombre">Nombre:</label>
        <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>

        <label for="txtMarca">Marca:</label>
        <asp:TextBox ID="txtMarca" runat="server"></asp:TextBox>

        <label>Categoria</label>
        <asp:DropDownList ID="ddlCategoria" runat="server"></asp:DropDownList>

        <label for="txtPrecio">Precio:</label>
        <asp:TextBox id="txtPrecio" runat="server"></asp:TextBox>

        <label for="txtStock">Stock:</label>
        <asp:TextBox id="txtStock" runat="server"></asp:TextBox>

        <label for="fuFoto">Foto:</label>
        <asp:FileUpload ID="fuFoto" runat="server" />

        <label for="txtObservación">Observacion</label>
        <asp:TextBox ID="txtObservacion" runat="server" TextMode="MultiLine"></asp:TextBox>

    </fieldset>
    <asp:Button ID="btnRegistar" runat="server" Text="Registar" CssClass="boton" OnClick="registar"/>
</asp:Content>
