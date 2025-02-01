<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis styleCategories="LayerConfiguration|Symbology|Labeling|Fields|Forms|Actions|MapTips|AttributeTable|Rendering|CustomProperties|Temporal|Notes" hasScaleBasedVisibilityFlag="0" readOnly="0" minScale="0" maxScale="0" version="3.22.16-Białowieża">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
    <Private>0</Private>
  </flags>
  <temporal limitMode="0" enabled="0" fixedDuration="0" startExpression="" endExpression="" mode="0" durationField="" startField="" accumulate="0" endField="" durationUnit="min">
    <fixedRange>
      <start></start>
      <end></end>
    </fixedRange>
  </temporal>
  <customproperties>
    <Option type="Map">
      <Option name="QFieldSync/action" value="copy" type="QString"/>
      <Option name="QFieldSync/attachment_naming" value="{}" type="QString"/>
      <Option name="QFieldSync/cloud_action" value="offline" type="QString"/>
      <Option name="QFieldSync/geometry_locked_expression" value="" type="QString"/>
      <Option name="QFieldSync/photo_naming" value="{}" type="QString"/>
      <Option name="QFieldSync/relationship_maximum_visible" value="{}" type="QString"/>
      <Option name="QFieldSync/tracking_distance_requirement_minimum_meters" value="30" type="int"/>
      <Option name="QFieldSync/tracking_erroneous_distance_safeguard_maximum_meters" value="1" type="int"/>
      <Option name="QFieldSync/tracking_measurement_type" value="0" type="int"/>
      <Option name="QFieldSync/tracking_time_requirement_interval_seconds" value="30" type="int"/>
      <Option name="QFieldSync/value_map_button_interface_threshold" value="0" type="int"/>
      <Option name="dualview/previewExpressions" type="List">
        <Option value="&quot;bknam&quot;" type="QString"/>
      </Option>
      <Option name="embeddedWidgets/count" value="0" type="int"/>
      <Option name="variableNames"/>
      <Option name="variableValues"/>
    </Option>
  </customproperties>
  <fieldConfiguration>
    <field name="pk" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="0" type="QString"/>
            <Option name="UseHtml" value="0" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="bknam" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="0" type="QString"/>
            <Option name="UseHtml" value="0" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="infiltrationsrateanfang" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="0" type="QString"/>
            <Option name="UseHtml" value="0" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="infiltrationsrateende" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="0" type="QString"/>
            <Option name="UseHtml" value="0" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="infiltrationsratestart" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="0" type="QString"/>
            <Option name="UseHtml" value="0" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="rueckgangskonstante" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="0" type="QString"/>
            <Option name="UseHtml" value="0" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="regenerationskonstante" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="0" type="QString"/>
            <Option name="UseHtml" value="0" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="saettigungswassergehalt" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="0" type="QString"/>
            <Option name="UseHtml" value="0" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="kommentar" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="0" type="QString"/>
            <Option name="UseHtml" value="0" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="createdat" configurationFlags="None">
      <editWidget type="DateTime">
        <config>
          <Option type="Map">
            <Option name="allow_null" value="1" type="QString"/>
            <Option name="calendar_popup" value="1" type="QString"/>
            <Option name="display_format" value="dd.MM.yyyy HH:mm:ss" type="QString"/>
            <Option name="field_format" value="yyyy-MM-dd HH:mm:ss" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <aliases>
    <alias name="" index="0" field="pk"/>
    <alias name="Name" index="1" field="bknam"/>
    <alias name="Infiltrationsrate Anfang" index="2" field="infiltrationsrateanfang"/>
    <alias name="Infiltrationsrate Ende" index="3" field="infiltrationsrateende"/>
    <alias name="Infiltrationsrate Start" index="4" field="infiltrationsratestart"/>
    <alias name="Rückgangskonstante" index="5" field="rueckgangskonstante"/>
    <alias name="Regenerationskonstante" index="6" field="regenerationskonstante"/>
    <alias name="Sättigungswassergehalt" index="7" field="saettigungswassergehalt"/>
    <alias name="Kommentar" index="8" field="kommentar"/>
    <alias name="bearbeitet" index="9" field="createdat"/>
  </aliases>
  <defaults>
    <default applyOnUpdate="0" expression="" field="pk"/>
    <default applyOnUpdate="0" expression="" field="bknam"/>
    <default applyOnUpdate="0" expression="" field="infiltrationsrateanfang"/>
    <default applyOnUpdate="0" expression="" field="infiltrationsrateende"/>
    <default applyOnUpdate="0" expression="" field="infiltrationsratestart"/>
    <default applyOnUpdate="0" expression="" field="rueckgangskonstante"/>
    <default applyOnUpdate="0" expression="" field="regenerationskonstante"/>
    <default applyOnUpdate="0" expression="" field="saettigungswassergehalt"/>
    <default applyOnUpdate="0" expression="" field="kommentar"/>
    <default applyOnUpdate="0" expression=" format_date( now(), 'yyyy-MM-dd HH:mm:ss')" field="createdat"/>
  </defaults>
  <constraints>
    <constraint unique_strength="2" notnull_strength="2" exp_strength="0" constraints="3" field="pk"/>
    <constraint unique_strength="0" notnull_strength="0" exp_strength="0" constraints="0" field="bknam"/>
    <constraint unique_strength="0" notnull_strength="0" exp_strength="0" constraints="0" field="infiltrationsrateanfang"/>
    <constraint unique_strength="0" notnull_strength="0" exp_strength="0" constraints="0" field="infiltrationsrateende"/>
    <constraint unique_strength="0" notnull_strength="0" exp_strength="0" constraints="0" field="infiltrationsratestart"/>
    <constraint unique_strength="0" notnull_strength="0" exp_strength="0" constraints="0" field="rueckgangskonstante"/>
    <constraint unique_strength="0" notnull_strength="0" exp_strength="0" constraints="0" field="regenerationskonstante"/>
    <constraint unique_strength="0" notnull_strength="0" exp_strength="0" constraints="0" field="saettigungswassergehalt"/>
    <constraint unique_strength="0" notnull_strength="0" exp_strength="0" constraints="0" field="kommentar"/>
    <constraint unique_strength="0" notnull_strength="0" exp_strength="0" constraints="0" field="createdat"/>
  </constraints>
  <constraintExpressions>
    <constraint exp="" desc="" field="pk"/>
    <constraint exp="" desc="" field="bknam"/>
    <constraint exp="" desc="" field="infiltrationsrateanfang"/>
    <constraint exp="" desc="" field="infiltrationsrateende"/>
    <constraint exp="" desc="" field="infiltrationsratestart"/>
    <constraint exp="" desc="" field="rueckgangskonstante"/>
    <constraint exp="" desc="" field="regenerationskonstante"/>
    <constraint exp="" desc="" field="saettigungswassergehalt"/>
    <constraint exp="" desc="" field="kommentar"/>
    <constraint exp="" desc="" field="createdat"/>
  </constraintExpressions>
  <expressionfields/>
  <attributeactions>
    <defaultAction key="Canvas" value="{00000000-0000-0000-0000-000000000000}"/>
  </attributeactions>
  <attributetableconfig sortOrder="0" actionWidgetStyle="dropDown" sortExpression="">
    <columns>
      <column name="pk" hidden="0" width="-1" type="field"/>
      <column name="bknam" hidden="0" width="-1" type="field"/>
      <column name="infiltrationsrateanfang" hidden="0" width="-1" type="field"/>
      <column name="infiltrationsrateende" hidden="0" width="-1" type="field"/>
      <column name="infiltrationsratestart" hidden="0" width="-1" type="field"/>
      <column name="rueckgangskonstante" hidden="0" width="-1" type="field"/>
      <column name="regenerationskonstante" hidden="0" width="-1" type="field"/>
      <column name="saettigungswassergehalt" hidden="0" width="-1" type="field"/>
      <column name="kommentar" hidden="0" width="-1" type="field"/>
      <column name="createdat" hidden="0" width="-1" type="field"/>
      <column hidden="1" width="-1" type="actions"/>
    </columns>
  </attributetableconfig>
  <conditionalstyles>
    <rowstyles/>
    <fieldstyles/>
  </conditionalstyles>
  <storedexpressions/>
  <editforminit/>
  <editforminitcodesource>0</editforminitcodesource>
  <editforminitfilepath></editforminitfilepath>
  <editforminitcode><![CDATA[# -*- coding: utf-8 -*-
"""
QGIS forms can have a Python function that is called when the form is
opened.

Use this function to add extra logic to your forms.

Enter the name of the function in the "Python Init function"
field.
An example follows:
"""
from qgis.PyQt.QtWidgets import QWidget

def my_form_open(dialog, layer, feature):
	geom = feature.geometry()
	control = dialog.findChild(QWidget, "MyLineEdit")
]]></editforminitcode>
  <featformsuppress>0</featformsuppress>
  <editorlayout>uifilelayout</editorlayout>
  <attributeEditorForm>
    <attributeEditorField showLabel="1" name="bknam" index="1"/>
    <attributeEditorField showLabel="1" name="infiltrationsrateanfang" index="2"/>
    <attributeEditorField showLabel="1" name="infiltrationsrateende" index="3"/>
    <attributeEditorField showLabel="1" name="infiltrationsratestart" index="4"/>
    <attributeEditorField showLabel="1" name="rueckgangskonstante" index="5"/>
    <attributeEditorField showLabel="1" name="regenerationskonstante" index="6"/>
    <attributeEditorField showLabel="1" name="saettigungswassergehalt" index="7"/>
    <attributeEditorField showLabel="1" name="kommentar" index="8"/>
  </attributeEditorForm>
  <editable>
    <field name="bknam" editable="1"/>
    <field name="createdat" editable="1"/>
    <field name="infiltrationsrateanfang" editable="1"/>
    <field name="infiltrationsrateende" editable="1"/>
    <field name="infiltrationsratestart" editable="1"/>
    <field name="kommentar" editable="1"/>
    <field name="pk" editable="1"/>
    <field name="regenerationskonstante" editable="1"/>
    <field name="rueckgangskonstante" editable="1"/>
    <field name="saettigungswassergehalt" editable="1"/>
  </editable>
  <labelOnTop>
    <field name="bknam" labelOnTop="0"/>
    <field name="createdat" labelOnTop="0"/>
    <field name="infiltrationsrateanfang" labelOnTop="0"/>
    <field name="infiltrationsrateende" labelOnTop="0"/>
    <field name="infiltrationsratestart" labelOnTop="0"/>
    <field name="kommentar" labelOnTop="0"/>
    <field name="pk" labelOnTop="0"/>
    <field name="regenerationskonstante" labelOnTop="0"/>
    <field name="rueckgangskonstante" labelOnTop="0"/>
    <field name="saettigungswassergehalt" labelOnTop="0"/>
  </labelOnTop>
  <reuseLastValue>
    <field name="bknam" reuseLastValue="0"/>
    <field name="createdat" reuseLastValue="0"/>
    <field name="infiltrationsrateanfang" reuseLastValue="0"/>
    <field name="infiltrationsrateende" reuseLastValue="0"/>
    <field name="infiltrationsratestart" reuseLastValue="0"/>
    <field name="kommentar" reuseLastValue="0"/>
    <field name="pk" reuseLastValue="0"/>
    <field name="regenerationskonstante" reuseLastValue="0"/>
    <field name="rueckgangskonstante" reuseLastValue="0"/>
    <field name="saettigungswassergehalt" reuseLastValue="0"/>
  </reuseLastValue>
  <dataDefinedFieldProperties/>
  <widgets/>
  <previewExpression>"bknam"</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>4</layerGeometryType>
</qgis>
