Feature: Get information about a color

  Scenario Outline: Ask to see specific color by name
    Given an english speaking user
     When the user says "<request a color>"
     Then mycroft reply should contain "<color name> has a hex value of <hex-value>. In R. G. B. this is Red <red-value>, Green <green-value>, Blue <blue-value>"

    Examples: requesting a color
      | request a color | color name | hex-value | red-value | green-value | blue-value |
      | show me the color red | red | F. F. 0. 0. 0. 0 | 255 | 0 | 0 |
      | what does the color yellow look like | yellow | F. F. F. F. 0. 0 | 255 | 255 | 0 |
      | show me the color dark salmon | dark salmon | E. 9. 9. 6. 7. A | 233 | 150 | 122 |
      | what does the color light goldenrod yellow look like | light goldenrod yellow | F. A. F. A. D. 2 | 250 | 250 | 210 |
      | show me the color deep skyblue | deep skyblue | 0. 0. B. F. F. F | 0 | 191 | 255 |

  Scenario Outline: Ask to see specific color by name that doesn't perfectly match
    Given an english speaking user
     When the user says "<request a color>"
     Then mycroft reply should contain "<color name> has a hex value of <hex-value>. In R. G. B. this is Red <red-value>, Green <green-value>, Blue <blue-value>"

    Examples: requesting a color without match
      | request a color | color name | hex-value | red-value | green-value | blue-value |
      | show me the color dark salmons | dark salmon | E. 9. 9. 6. 7. A | 233 | 150 | 122 |
      | what does the color light golden rod yellow look like | light goldenrod yellow | F. A. F. A. D. 2 | 250 | 250 | 210 |
      | show me the color deep sky blue | deep skyblue | 0. 0. B. F. F. F | 0 | 191 | 255 |
      | show me the color sea shell | seashell | F. F. F. 5. E. E | 255 | 245 | 238 |

  @xfail
  Scenario Outline: Ask to see color without using color keyword
    Given an english speaking user
     When the user says "<request a color>"
     Then mycroft reply should contain "<color name> has a hex value of <hex-value>. In R. G. B. this is Red <red-value>, Green <green-value>, Blue <blue-value>"

    Examples: requesting a color without color keyword
      | request a color | color name | hex-value | red-value | green-value | blue-value |
      | show me fire brick  | fire brick | B. 2. 2. 2. 2. 2 | 178 | 34 | 34 |
      | show me firebrick  | fire brick | B. 2. 2. 2. 2. 2 | 178 | 34 | 34 |
      | show me fire brick red  | fire brick | B. 2. 2. 2. 2. 2 | 178 | 34 | 34 |
      | show me light sea green | light sea green | 2. 0. B. 2. A. A | 32 | 178 | 170 |
      | show me light seagreen | light sea green | 2. 0. B. 2. A. A | 32 | 178 | 170 |

  @xfail
  Scenario Outline: Ask for hex value of color by name
    Given an english speaking user
     When the user says "<request a color hex value>"
     Then mycroft reply should contain "<color name> has a hex value of <hex-value>.

    Examples: requesting hex code by color name
      | request a color  hex value| color name | hex-value |
      | what's the hex code for red | red | F. F. 0. 0. 0. 0 |
      | what is the hex of yellow | yellow | F. F. F. F. 0. 0 |

  @xfail
  Scenario Outline: Ask for RGB values of color by name
    Given an english speaking user
     When the user says "<request a color hex value>"
     Then mycroft reply should contain "<color name> is, Red <red-value>, Green <green-value>, Blue <blue-value>"

    Examples: requesting rgb values by color name
      | request a color  hex value| color name | red-value | green-value | blue-value |
      | what's the rgb code for red | red | 255 | 0 | 0 |
      | what is the hex of yellow | yellow | 255 | 255 | 0 |

  Scenario Outline: Ask for color by hex value with known name
    Given an english speaking user
     When the user says "<request by hex>"
     Then mycroft reply should contain "That is <color name>. Its R. G. B. values are, Red <red-value>, Green <green-value>, Blue <blue-value>"

    Examples: requesting a color by hex
      | request by hex | color name | red-value | green-value | blue-value |
      | what color has a hex code of ff0000 | red | 255 | 0 | 0 |
      | what color has a hex code of e9967a | dark salmon | 233 | 150 | 122 |

  Scenario Outline: Ask for color by hex value with unknown name
    Given an english speaking user
     When the user says "<request by hex>"
     Then mycroft reply should contain "The R. G. B. values for this color are, Red <red-value>, Green <green-value>, Blue <blue-value>"

    Examples: requesting a color by hex
      | request by hex | red-value | green-value | blue-value |
      | what color has a hex code of ff0001 | 255 | 0 | 1 |
      | what color has a hex code of fadfad | 250 | 223 | 173 |

  Scenario Outline: Ask for color by RGB values with known name
    Given an english speaking user
      When the user says "<request by RGB>"
      Then mycroft reply should contain "<hex-value>"

    Examples: requesting a color by RGB value
      | request by RGB | color name | hex-value |
      | what color has an RGB value of 255 0 0 | red | F. F. 0. 0. 0. 0 |
      | what color has an RGB value of 233 150 122 | dark salmon | E. 9. 9. 6. 7. A |

  Scenario Outline: Ask for color by RGB values with unknown name
    Given an english speaking user
      When the user says "<request by RGB>"
      Then mycroft reply should contain "<hex-value>"

    Examples: requesting a color by RGB value
      | request by RGB | hex-value |
      | what color has an RGB value of 255 0 1 | F. F. 0. 0. 0. 1 |
      | what color has an RGB value of 250 223 173 | F. A. D. F. A. D |


