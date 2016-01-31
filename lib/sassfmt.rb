require "sassfmt/version"

module Sassfmt
  # From https://github.com/brigade/scss-lint/blob/fe04ca9de2d1cf1b28122fb3add7116bef995edd/data/property-sort-orders/recess.txt
  # which itself was modified from https://github.com/twitter/recess.
  PROPERTY_ORDER = %w(position top right bottom left z-index display
align-content align-items align-self flex flex-basis flex-direction flex-flow
flex-grow flex-shrink flex-wrap justify-content order float width height
max-width max-height min-width min-height padding padding-top padding-right
padding-bottom padding-left margin margin-top margin-right margin-bottom
margin-left margin-collapse margin-top-collapse margin-right-collapse
margin-bottom-collapse margin-left-collapse overflow overflow-x overflow-y clip
clear font font-family font-size font-smoothing osx-font-smoothing font-style
font-weight hyphens src line-height letter-spacing word-spacing color
text-align text-decoration text-indent text-overflow text-rendering
text-size-adjust text-shadow text-transform word-break word-wrap white-space
vertical-align list-style list-style-type list-style-position list-style-image
pointer-events cursor background background-attachment background-color
background-image background-position background-repeat background-size border
border-collapse border-top border-right border-bottom border-left border-color
border-image border-top-color border-right-color border-bottom-color
border-left-color border-spacing border-style border-top-style
border-right-style border-bottom-style border-left-style border-width
border-top-width border-right-width border-bottom-width border-left-width
border-radius border-top-right-radius border-bottom-right-radius
border-bottom-left-radius border-top-left-radius border-radius-topright
border-radius-bottomright border-radius-bottomleft border-radius-topleft
content quotes outline outline-offset outline-width outline-style outline-color
opacity filter visibility size zoom transform box-align box-flex box-orient
box-pack box-shadow box-sizing table-layout animation animation-delay
animation-duration animation-iteration-count animation-name
animation-play-state animation-timing-function animation-fill-mode transition
transition-delay transition-duration transition-property
transition-timing-function background-clip backface-visibility resize
appearance user-select interpolation-mode direction marks page set-link-source
unicode-bidi speak).map.with_index { |p, i| [p, i] }.to_h

  PROPERTY_REGEXP = /^\s*([a-zA-Z0-9-]+)\s*:/

  def self.format(sass)
    sass.lines.chunk do |line|
      [!!(line =~ PROPERTY_REGEXP), line.match(/^\s*/)[0].size]
    end.flat_map do |((is_property, _), lines)|
      if is_property
        lines.sort_by.with_index do |line, i|
          [PROPERTY_ORDER[line.match(PROPERTY_REGEXP)[1]] || Float::INFINITY, i]
        end
      else
        lines
      end
    end.join
  end
end
