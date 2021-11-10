﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Xml;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        FileStream fs = new FileStream(@"c:\SuperProProductList.xml", FileMode.Create);
        XmlTextWriter w = new XmlTextWriter (fs, null);
        w.WriteStartDocument();
        w.WriteStartElement("SuperProProductList");
        w.WriteComment("This file generated by the XmlTextWriter class.");

        //Write the first product
        w.WriteStartElement("Product");
        w.WriteAttributeString("ID", "", "1");
        w.WriteAttributeString("Name", "", "Chair");

        w.WriteStartElement("Price");
        w.WriteString("49.33");
        w.WriteEndElement();

        w.WriteEndElement();

        // Write the second product.

        // Write the second product.
        w.WriteStartElement("Product");
        w.WriteAttributeString("ID", "", "2");
        w.WriteAttributeString("Name", "", "Car");
        w.WriteStartElement("Price");
        w.WriteString("43399.55");
        w.WriteEndElement();

        w.WriteEndElement();

        //Write The thir product
        w.WriteStartElement("Product");
        w.WriteAttributeString("ID", "", "3");
        w.WriteAttributeString("Name", "", "Fresh Fruit Basket");
        w.WriteStartElement("Price");
        w.WriteString("49.99");
        w.WriteEndElement();

        w.WriteEndElement();
        // Close the root element.
        w.WriteEndElement();
        w.WriteEndDocument();
        w.Close();

        lblXml.Text = @"File c:\SuperProProductList.xml written successfully.";

    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        // Open a stream to the file.
        FileStream fs = new FileStream(@"c:\SuperProProductList.xml", FileMode.Open);
        XmlTextReader r = new XmlTextReader(fs);

        // Create a generic collection of products.
        List<Product> products = new List<Product>();

        // Loop through the products.
        while (r.Read())
        {
            if (r.NodeType == XmlNodeType.Element && r.Name == "Product")
            {
                Product newProduct = new Product();
                newProduct.ID = Int32.Parse(r.GetAttribute(0));
                newProduct.Name = r.GetAttribute(1);
                // Get the rest of the subtags for this product.
                while (r.NodeType != XmlNodeType.EndElement)
                {
                    r.Read();
                    // Look tor Price subtags.
                    if (r.Name == "Price")
                    {
                        while (r.NodeType != XmlNodeType.EndElement)
                        {
                            r.Read();
                            if (r.NodeType == XmlNodeType.Text)
                            {
                                newProduct.Price = Decimal.Parse(r.Value);
                            }
                        }
                    }
                    // You could check for other Product nodes
                    // (like Available, Status, etc.) here.
                }
                // add the product to the list.
                products.Add(newProduct);
            }
        }
        r.Close();
        // Display the retrieved document .
        GridResults.DataSource = products;
        GridResults.DataBind();
    }

    protected void cmdReadXml_Click(object sender, EventArgs e)
    {
        FileStream fs = new FileStream(@"c:\SuperProProductList.xml", FileMode.Open);
        XmlTextReader r = new XmlTextReader(fs);

        // Store the whole file in a Stringlriter (much quicker than using
        // string operations) .
        StringWriter writer = new StringWriter();

        // Parse the file and read each node.

        while (r.Read())
        {
            writer.Write("<b>Type:</b> ");
            writer.Write(r.NodeType.ToString());
            writer.Write("<br>");
            if (r.Name != "")
            {
                writer.Write("<b>Name:</b> ");
                writer.Write(r.Name);
                writer.Write("<br>");
            }
            if (r.Value != "")
            {
                writer.Write("<b>Value:</b> ");
                writer.Write(r.Value);
                writer.Write("<br>");
            }
            if (r.AttributeCount > 0)
            {
                writer.Write("<b>Attributes:</b> ");
                for (int i = 0; i < r.AttributeCount; i++)
                {
                    writer.Write(" ");
                    writer.Write(r.GetAttribute(i));
                    writer.Write(" ");
                }
                writer.Write("<br>");
            }
            writer.Write("<br>");
        }
        r.Close();
        // Copy the string content into a label to display it.
        lblXml.Text = writer.ToString();
    }   
}