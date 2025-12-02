<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis readOnly="0" styleCategories="LayerConfiguration|Fields|Forms|AttributeTable" version="3.28.13-Firenze">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
    <Private>0</Private>
  </flags>
  <fieldConfiguration>
    <field name="pk" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" name="IsMultiline" type="bool"/>
            <Option value="false" name="UseHtml" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="bezext" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" name="IsMultiline" type="bool"/>
            <Option value="false" name="UseHtml" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="bezqkan" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" name="IsMultiline" type="bool"/>
            <Option value="false" name="UseHtml" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="kuerzel" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" name="IsMultiline" type="bool"/>
            <Option value="false" name="UseHtml" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="subject" configurationFlags="None">
      <editWidget type="Hidden">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="modul" configurationFlags="None">
      <editWidget type="Hidden">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="kommentar" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" name="IsMultiline" type="bool"/>
            <Option value="false" name="UseHtml" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="createdat" configurationFlags="None">
      <editWidget type="DateTime">
        <config>
          <Option type="Map">
            <Option value="true" name="allow_null" type="bool"/>
            <Option value="true" name="calendar_popup" type="bool"/>
            <Option value="dd.MMM.yyyy HH:mm:ss" name="display_format" type="QString"/>
            <Option value="yyyy-MM-dd HH:mm:ss" name="field_format" type="QString"/>
            <Option value="false" name="field_iso_format" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="Thema" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <aliases>
    <alias field="pk" name="Nr" index="0"/>
    <alias field="bezext" name="Externe Bezeichnung" index="1"/>
    <alias field="bezqkan" name="Bezeichung" index="2"/>
    <alias field="kuerzel" name="Kürzel" index="3"/>
    <alias field="subject" name="" index="4"/>
    <alias field="modul" name="" index="5"/>
    <alias field="kommentar" name="Kommentar" index="6"/>
    <alias field="createdat" name="erstellt" index="7"/>
    <alias field="Thema" name="" index="8"/>
  </aliases>
  <defaults>
    <default field="pk" expression="" applyOnUpdate="0"/>
    <default field="bezext" expression="" applyOnUpdate="0"/>
    <default field="bezqkan" expression="" applyOnUpdate="0"/>
    <default field="kuerzel" expression="" applyOnUpdate="0"/>
    <default field="subject" expression="'import_knotentypen'" applyOnUpdate="0"/>
    <default field="modul" expression="'m150'" applyOnUpdate="0"/>
    <default field="kommentar" expression="" applyOnUpdate="0"/>
    <default field="createdat" expression="" applyOnUpdate="0"/>
    <default field="Thema" expression="" applyOnUpdate="0"/>
  </defaults>
  <constraints>
    <constraint constraints="3" field="pk" exp_strength="0" notnull_strength="1" unique_strength="1"/>
    <constraint constraints="0" field="bezext" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint constraints="0" field="bezqkan" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint constraints="0" field="kuerzel" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint constraints="0" field="subject" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint constraints="0" field="modul" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint constraints="0" field="kommentar" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint constraints="0" field="createdat" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint constraints="0" field="Thema" exp_strength="0" notnull_strength="0" unique_strength="0"/>
  </constraints>
  <constraintExpressions>
    <constraint field="pk" exp="" desc=""/>
    <constraint field="bezext" exp="" desc=""/>
    <constraint field="bezqkan" exp="" desc=""/>
    <constraint field="kuerzel" exp="" desc=""/>
    <constraint field="subject" exp="" desc=""/>
    <constraint field="modul" exp="" desc=""/>
    <constraint field="kommentar" exp="" desc=""/>
    <constraint field="createdat" exp="" desc=""/>
    <constraint field="Thema" exp="" desc=""/>
  </constraintExpressions>
  <expressionfields>
    <field expression="  title(replace(subject, 'export_', ''))" precision="0" subType="0" name="Thema" comment="" typeName="text" length="-1" type="10"/>
  </expressionfields>
  <attributetableconfig sortOrder="0" sortExpression="&quot;bezext&quot;" actionWidgetStyle="dropDown">
    <columns>
      <column name="pk" type="field" width="-1" hidden="0"/>
      <column name="Thema" type="field" width="138" hidden="0"/>
      <column name="bezext" type="field" width="163" hidden="0"/>
      <column name="bezqkan" type="field" width="162" hidden="0"/>
      <column name="kuerzel" type="field" width="100" hidden="0"/>
      <column name="subject" type="field" width="192" hidden="1"/>
      <column name="modul" type="field" width="102" hidden="1"/>
      <column name="kommentar" type="field" width="159" hidden="0"/>
      <column name="createdat" type="field" width="164" hidden="0"/>
      <column type="actions" width="-1" hidden="1"/>
    </columns>
  </attributetableconfig>
  <conditionalstyles>
    <rowstyles/>
    <fieldstyles>
      <fieldstyle fieldname="kuerzel">
        <style name="Fehlendes M150-Kürzel" background_color="#fb9a99" rule=" (kuerzel IS NULL OR kuerzel = '') AND modul = 'm150porter'" background_color_alpha="255">
          <font description="MS Shell Dlg 2,8.25,-1,5,50,0,0,0,0,0" bold="0" italic="0" strikethrough="0" style="" underline="0"/>
        </style>
      </fieldstyle>
    </fieldstyles>
  </conditionalstyles>
  <storedexpressions/>
  <editforminit/>
  <editforminitcodesource>0</editforminitcodesource>
  <editforminitfilepath></editforminitfilepath>
  <editforminitcode><![CDATA[# -*- coding: utf-8 -*-
"""
QGIS-Formulare können eine Python-Funktion haben,, die aufgerufen wird, wenn sich das Formular öffnet

Diese Funktion kann verwendet werden um dem Formular Extralogik hinzuzufügen.

Der Name der Funktion wird im Feld "Python Init-Function" angegeben
Ein Beispiel folgt:
"""
from qgis.PyQt.QtWidgets import QWidget

def my_form_open(dialog, layer, feature):
	geom = feature.geometry()
	control = dialog.findChild(QWidget, "MyLineEdit")
]]></editforminitcode>
  <featformsuppress>0</featformsuppress>
  <editorlayout>generatedlayout</editorlayout>
  <editable>
    <field name="Thema" editable="0"/>
    <field name="bezext" editable="1"/>
    <field name="bezqkan" editable="1"/>
    <field name="createdat" editable="1"/>
    <field name="kommentar" editable="1"/>
    <field name="kuerzel" editable="1"/>
    <field name="modul" editable="1"/>
    <field name="pk" editable="0"/>
    <field name="subject" editable="1"/>
  </editable>
  <labelOnTop>
    <field name="Thema" labelOnTop="0"/>
    <field name="bezext" labelOnTop="0"/>
    <field name="bezqkan" labelOnTop="0"/>
    <field name="createdat" labelOnTop="0"/>
    <field name="kommentar" labelOnTop="0"/>
    <field name="kuerzel" labelOnTop="0"/>
    <field name="modul" labelOnTop="0"/>
    <field name="pk" labelOnTop="0"/>
    <field name="subject" labelOnTop="0"/>
  </labelOnTop>
  <reuseLastValue>
    <field reuseLastValue="0" name="Thema"/>
    <field reuseLastValue="0" name="bezext"/>
    <field reuseLastValue="0" name="bezqkan"/>
    <field reuseLastValue="0" name="createdat"/>
    <field reuseLastValue="0" name="kommentar"/>
    <field reuseLastValue="0" name="kuerzel"/>
    <field reuseLastValue="0" name="modul"/>
    <field reuseLastValue="0" name="pk"/>
    <field reuseLastValue="0" name="subject"/>
  </reuseLastValue>
  <dataDefinedFieldProperties/>
  <widgets/>
  <previewExpression>"bezext"</previewExpression>
  <layerGeometryType>4</layerGeometryType>
</qgis>
