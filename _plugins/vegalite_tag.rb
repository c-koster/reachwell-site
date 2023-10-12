require 'json'

module Jekyll
  class VegaLiteBlock < Liquid::Block
    def initialize(tag_name, markup, tokens)
      super
      @vega_lite_spec = nil
    end

    def render(context)
      # If the content of the block has been captured, proceed
      if @vega_lite_spec
        # Convert the captured content (Vega-Lite spec) to a JSON object
        vega_lite_spec_json = JSON.parse(@vega_lite_spec)

        # Generate a unique ID for the chart container
        chart_id = "vegalite-chart-#{SecureRandom.hex(5)}"

        # Render the HTML container for the chart
        output = "<div id='#{chart_id}'></div>"

        # JavaScript to render the chart using Vega-Lite
        output += <<~HTML
          <script>
            (function() {
              var spec = #{vega_lite_spec_json.to_json};
              vegaEmbed('##{chart_id}', spec).then(function(result) {
                // You can handle the chart, or any post-processing here
              }).catch(console.error);
            })();
          </script>
        HTML

        output
      else
        # If the content is not captured, return an empty string
        ''
      end
    end

    def unknown_tag(tag, markup, tokens)
      if tag == 'vega'
        # Capture the content of the block
        @vega_lite_spec = super
      end
    end
  end
end
Liquid::Template.register_tag('vega', Jekyll::VegaLiteBlock)