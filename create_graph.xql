xquery version "3.1";

declare namespace output = "http://www.w3.org/2010/xslt-xquery-serialization";
declare namespace tei = 'http://www.tei-c.org/ns/1.0';
declare namespace gml = 'http://graphml.graphdrawing.org/xmlns';
declare option output:omit-xml-declaration "no";

<gml:graphml>
    <gml:key id="d0" for="node" attr.name="type" attr.type="string"/>
    <gml:graph edgedefault="undirected">
    {


        let $texts := collection('/db/mpese/tei/corpus/texts/')

        (: iterate through the texts :)
        for $text in $texts
            (: create a short id for the text :)
            let $text_id := fn:replace(fn:base-uri($text), '/db/mpese/tei/corpus/texts/', '')
            (: get ms for text if exists :)
            let $text_mss_ref := $text//tei:sourceDesc/tei:msDesc/@corresp/string()
            let $text_mss := fn:replace($text_mss_ref, '../mss/', '')
            let $text_mss_nodes := if (not($text_mss eq '')) then (<gml:node id="{$text_mss}"><gml:data key="d0">witness</gml:data></gml:node>,<gml:edge source="{$text_id}" target="{$text_mss}"/>) else ()
            return (
            <gml:node id="{$text_id}">
                <gml:data key="d0">text</gml:data>
            </gml:node>,$text_mss_nodes,

            let $witness_list := $text//tei:listBibl[@xml:id="mss_witness_generated"]/tei:bibl/tei:ref

            for $witness in $witness_list
                let $ms_uri := fn:replace($witness/@target/fn:string(), '../mss/', '')
            return
                (<gml:node id="{$ms_uri}"><gml:data key="d0">witness</gml:data></gml:node>,
                <gml:edge source="{$text_id}" target="{$ms_uri}"/>)


            )

}</gml:graph>
</gml:graphml>