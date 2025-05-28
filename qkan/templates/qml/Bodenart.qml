<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis maxScale="0" styleCategories="LayerConfiguration|Symbology|Labeling|Fields|Forms|Actions|MapTips|AttributeTable|Rendering|CustomProperties|Relations|Temporal|Legend|Notes" hasScaleBasedVisibilityFlag="0" minScale="0" version="3.28.15-Firenze" readOnly="0">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
    <Private>0</Private>
  </flags>
  <temporal endField="" accumulate="0" startField="" endExpression="" fixedDuration="0" mode="0" limitMode="0" durationField="" enabled="0" durationUnit="min" startExpression="">
    <fixedRange>
      <start></start>
      <end></end>
    </fixedRange>
  </temporal>
  <customproperties>
    <Option type="Map">
      <Option value="copy" type="QString" name="QFieldSync/action"/>
      <Option value="{}" type="QString" name="QFieldSync/attachment_naming"/>
      <Option value="offline" type="QString" name="QFieldSync/cloud_action"/>
      <Option value="" type="QString" name="QFieldSync/geometry_locked_expression"/>
      <Option value="{}" type="QString" name="QFieldSync/photo_naming"/>
      <Option value="{}" type="QString" name="QFieldSync/relationship_maximum_visible"/>
      <Option value="30" type="int" name="QFieldSync/tracking_distance_requirement_minimum_meters"/>
      <Option value="1" type="int" name="QFieldSync/tracking_erroneous_distance_safeguard_maximum_meters"/>
      <Option value="0" type="int" name="QFieldSync/tracking_measurement_type"/>
      <Option value="30" type="int" name="QFieldSync/tracking_time_requirement_interval_seconds"/>
      <Option value="0" type="int" name="QFieldSync/value_map_button_interface_threshold"/>
      <Option type="List" name="dualview/previewExpressions">
        <Option value="&quot;bknam&quot;" type="QString"/>
      </Option>
      <Option value="0" type="int" name="embeddedWidgets/count"/>
      <Option name="variableNames"/>
      <Option name="variableValues"/>
    </Option>
  </customproperties>
  <legend type="default-vector" showLabelLegend="0"/>
  <referencedLayers/>
  <fieldConfiguration>
    <field configurationFlags="None" name="pk">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="bknam">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="infiltrationsrateanfang">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="infiltrationsrateende">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="infiltrationsratestart">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="rueckgangskonstante">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="regenerationskonstante">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="saettigungswassergehalt">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="kommentar">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="createdat">
      <editWidget type="DateTime">
        <config>
          <Option type="Map">
            <Option value="1" type="QString" name="allow_null"/>
            <Option value="1" type="QString" name="calendar_popup"/>
            <Option value="dd.MM.yyyy HH:mm:ss" type="QString" name="display_format"/>
            <Option value="yyyy-MM-dd HH:mm:ss" type="QString" name="field_format"/>
          </Option>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <aliases>
    <alias field="pk" index="0" name=""/>
    <alias field="bknam" index="1" name="Name"/>
    <alias field="infiltrationsrateanfang" index="2" name="Infilt_rate Max (Anfang)"/>
    <alias field="infiltrationsrateende" index="3" name="Infilt_rate Min (Ende)"/>
    <alias field="infiltrationsratestart" index="4" name="Infilt_rate Simulationsstart"/>
    <alias field="rueckgangskonstante" index="5" name="Rückgangskonstante"/>
    <alias field="regenerationskonstante" index="6" name="Regenerationskonstante"/>
    <alias field="saettigungswassergehalt" index="7" name="Sättigungswassergehalt"/>
    <alias field="kommentar" index="8" name="Kommentar"/>
    <alias field="createdat" index="9" name="bearbeitet"/>
  </aliases>
  <defaults>
    <default expression="" applyOnUpdate="0" field="pk"/>
    <default expression="" applyOnUpdate="0" field="bknam"/>
    <default expression="" applyOnUpdate="0" field="infiltrationsrateanfang"/>
    <default expression="" applyOnUpdate="0" field="infiltrationsrateende"/>
    <default expression="" applyOnUpdate="0" field="infiltrationsratestart"/>
    <default expression="" applyOnUpdate="0" field="rueckgangskonstante"/>
    <default expression="" applyOnUpdate="0" field="regenerationskonstante"/>
    <default expression="" applyOnUpdate="0" field="saettigungswassergehalt"/>
    <default expression="" applyOnUpdate="0" field="kommentar"/>
    <default expression=" format_date( now(), 'yyyy-MM-dd HH:mm:ss')" applyOnUpdate="0" field="createdat"/>
  </defaults>
  <constraints>
    <constraint notnull_strength="2" exp_strength="0" field="pk" constraints="3" unique_strength="2"/>
    <constraint notnull_strength="0" exp_strength="0" field="bknam" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="infiltrationsrateanfang" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="infiltrationsrateende" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="infiltrationsratestart" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="rueckgangskonstante" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="regenerationskonstante" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="saettigungswassergehalt" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="kommentar" constraints="0" unique_strength="0"/>
    <constraint notnull_strength="0" exp_strength="0" field="createdat" constraints="0" unique_strength="0"/>
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
  <attributetableconfig actionWidgetStyle="dropDown" sortOrder="0" sortExpression="">
    <columns>
      <column hidden="0" type="field" width="-1" name="pk"/>
      <column hidden="0" type="field" width="-1" name="bknam"/>
      <column hidden="0" type="field" width="-1" name="infiltrationsrateanfang"/>
      <column hidden="0" type="field" width="-1" name="infiltrationsrateende"/>
      <column hidden="0" type="field" width="-1" name="infiltrationsratestart"/>
      <column hidden="0" type="field" width="-1" name="rueckgangskonstante"/>
      <column hidden="0" type="field" width="-1" name="regenerationskonstante"/>
      <column hidden="0" type="field" width="-1" name="saettigungswassergehalt"/>
      <column hidden="0" type="field" width="-1" name="kommentar"/>
      <column hidden="0" type="field" width="-1" name="createdat"/>
      <column hidden="1" type="actions" width="-1"/>
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
    <labelStyle labelColor="0,0,0,255" overrideLabelColor="0" overrideLabelFont="0">
      <labelFont style="" description="MS Shell Dlg 2,8.25,-1,5,50,0,0,0,0,0" italic="0" bold="0" underline="0" strikethrough="0"/>
    </labelStyle>
    <attributeEditorField index="1" showLabel="1" name="bknam">
      <labelStyle labelColor="0,0,0,255" overrideLabelColor="0" overrideLabelFont="0">
        <labelFont style="" description="MS Shell Dlg 2,7.8,-1,5,50,0,0,0,0,0" italic="0" bold="0" underline="0" strikethrough="0"/>
      </labelStyle>
    </attributeEditorField>
    <attributeEditorField index="2" showLabel="1" name="infiltrationsrateanfang">
      <labelStyle labelColor="0,0,0,255" overrideLabelColor="0" overrideLabelFont="0">
        <labelFont style="" description="MS Shell Dlg 2,7.8,-1,5,50,0,0,0,0,0" italic="0" bold="0" underline="0" strikethrough="0"/>
      </labelStyle>
    </attributeEditorField>
    <attributeEditorField index="3" showLabel="1" name="infiltrationsrateende">
      <labelStyle labelColor="0,0,0,255" overrideLabelColor="0" overrideLabelFont="0">
        <labelFont style="" description="MS Shell Dlg 2,7.8,-1,5,50,0,0,0,0,0" italic="0" bold="0" underline="0" strikethrough="0"/>
      </labelStyle>
    </attributeEditorField>
    <attributeEditorField index="4" showLabel="1" name="infiltrationsratestart">
      <labelStyle labelColor="0,0,0,255" overrideLabelColor="0" overrideLabelFont="0">
        <labelFont style="" description="MS Shell Dlg 2,7.8,-1,5,50,0,0,0,0,0" italic="0" bold="0" underline="0" strikethrough="0"/>
      </labelStyle>
    </attributeEditorField>
    <attributeEditorField index="5" showLabel="1" name="rueckgangskonstante">
      <labelStyle labelColor="0,0,0,255" overrideLabelColor="0" overrideLabelFont="0">
        <labelFont style="" description="MS Shell Dlg 2,7.8,-1,5,50,0,0,0,0,0" italic="0" bold="0" underline="0" strikethrough="0"/>
      </labelStyle>
    </attributeEditorField>
    <attributeEditorField index="6" showLabel="1" name="regenerationskonstante">
      <labelStyle labelColor="0,0,0,255" overrideLabelColor="0" overrideLabelFont="0">
        <labelFont style="" description="MS Shell Dlg 2,7.8,-1,5,50,0,0,0,0,0" italic="0" bold="0" underline="0" strikethrough="0"/>
      </labelStyle>
    </attributeEditorField>
    <attributeEditorField index="7" showLabel="1" name="saettigungswassergehalt">
      <labelStyle labelColor="0,0,0,255" overrideLabelColor="0" overrideLabelFont="0">
        <labelFont style="" description="MS Shell Dlg 2,7.8,-1,5,50,0,0,0,0,0" italic="0" bold="0" underline="0" strikethrough="0"/>
      </labelStyle>
    </attributeEditorField>
    <attributeEditorField index="8" showLabel="1" name="kommentar">
      <labelStyle labelColor="0,0,0,255" overrideLabelColor="0" overrideLabelFont="0">
        <labelFont style="" description="MS Shell Dlg 2,7.8,-1,5,50,0,0,0,0,0" italic="0" bold="0" underline="0" strikethrough="0"/>
      </labelStyle>
    </attributeEditorField>
  </attributeEditorForm>
  <editable>
    <field editable="1" name="bknam"/>
    <field editable="1" name="createdat"/>
    <field editable="1" name="infiltrationsrateanfang"/>
    <field editable="1" name="infiltrationsrateende"/>
    <field editable="1" name="infiltrationsratestart"/>
    <field editable="1" name="kommentar"/>
    <field editable="1" name="pk"/>
    <field editable="1" name="regenerationskonstante"/>
    <field editable="1" name="rueckgangskonstante"/>
    <field editable="1" name="saettigungswassergehalt"/>
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
    <field reuseLastValue="0" name="bknam"/>
    <field reuseLastValue="0" name="createdat"/>
    <field reuseLastValue="0" name="infiltrationsrateanfang"/>
    <field reuseLastValue="0" name="infiltrationsrateende"/>
    <field reuseLastValue="0" name="infiltrationsratestart"/>
    <field reuseLastValue="0" name="kommentar"/>
    <field reuseLastValue="0" name="pk"/>
    <field reuseLastValue="0" name="regenerationskonstante"/>
    <field reuseLastValue="0" name="rueckgangskonstante"/>
    <field reuseLastValue="0" name="saettigungswassergehalt"/>
  </reuseLastValue>
  <dataDefinedFieldProperties/>
  <widgets/>
  <previewExpression>"bknam"</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>4</layerGeometryType>
</qgis>
