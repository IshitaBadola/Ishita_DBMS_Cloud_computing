from lxml import etree

xml_file = "book.xml"
xsd_file = "book.xsd"

with open(xsd_file, "rb") as f:
    xsd = etree.XML(f.read())

schema = etree.XMLSchema(xsd)

xml_doc = etree.parse(xml_file)

if schema.validate(xml_doc):
    print("XML valid")
else:
    print("XML invalid")
for error in schema.error_log:
    print(error)