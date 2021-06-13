Config = {}
Config.Locale = 'en'
--You can add here buttons like inventory menu button. When player click this button, then action will be cancel.
Config.cancel_buttons = {289, 170, 168, 56}
options =
{
  ['seed_weed'] = {
        object = 'prop_weed_01',
        end_object = 'prop_weed_02',
        fail_msg = 'Roślina zwiędła!',
        success_msg = 'Zebrano uprawy!',
        start_msg = 'Sadzenie rośliny...',
        success_item = 'weed',
        first_step = 1.70,
        steps = 1,
        cords = {
        	--{x = 2226.7, y = 5576.78, z = 53.95, distance = 10.25},
		      {distance = 10.25},  
          --{distance = 10.25},
          --{distance = 20.25},
          --{x = 706.05, y = 1269.25, z = 358, distance = 10.25},
         -- {x = 1344.05, y = 4387.25, z = 44, distance = 10.25},
          --{x = 1540.85, y = 6335.87, z = 24, distance = 10.25},
         -- {x = 530.74, y = 3093.65, z = 40, distance = 10.25},
         -- {x = -1493.47, y = 4406.66, z = 21.88, distance = 10.25},
        },
        animations_end = {
          {lib = 'amb@world_human_gardener_plant@male@enter', anim ='enter', timeout = '3500'},
          {lib = 'amb@world_human_gardener_plant@male@exit', anim ='exit', timeout = '4500'},
        },
        animations_step = {
          {lib = 'amb@world_human_gardener_plant@male@enter', anim = 'enter', timeout = '3500'},
          {lib = 'amb@world_human_gardener_plant@male@base', anim ='base', timeout = '8000'},
          {lib = 'amb@world_human_gardener_plant@male@base', anim ='base', timeout = '8000'},
          {lib = 'amb@world_human_gardener_plant@male@base', anim ='base', timeout = '8000'},
          {lib = 'amb@world_human_gardener_plant@male@base', anim ='base', timeout = '8000'},
          {lib = 'amb@world_human_gardener_plant@male@base', anim ='base', timeout = '8000'},
          {lib = 'amb@world_human_gardener_plant@male@idle_a', anim ='idle_a', timeout = '9000'},
          {lib = 'amb@world_human_gardener_plant@male@exit', anim ='exit', timeout = '4500'},
        },
        grow = {
          1.00
        },
        questions = {
            {
                title = 'Uprawa rośliny',
                steps = {
                    {label = 'Pielęgnuj i zbierz', value = 1, min = 5, max = 5},
                },
                correct = 1
            },
        },
      },

      ['seed_amfa'] = {
        object = 'bkr_prop_coke_table01a',
        end_object = 'bkr_prop_meth_hcacid',
        fail_msg = 'Cos poszlo nie tak, towar przepadl!',
        success_msg = 'Towar zapakowany!',
        start_msg = 'Rozstawianie sprzetu do pracy...',
        success_item = 'amfa',
        first_step = 1.70,
        steps = 1,
        cords = {
          {distance = 10.25},  
            --{x = -360.1054, y = -430.0021, z = 23.34, distance = 10.25},
              },
        animations_end = {
            {lib = 'amb@world_human_gardener_plant@male@enter', anim ='enter', timeout = '3500'},
            {lib = 'amb@world_human_gardener_plant@male@exit', anim ='exit', timeout = '4500'},
        },
        animations_step = {
          {lib = 'amb@world_human_gardener_plant@male@enter', anim = 'enter', timeout = '4000'},
          {lib = 'amb@world_human_gardener_plant@male@base', anim ='base', timeout = '5000'},
         -- {lib = 'amb@world_human_gardener_plant@male@base', anim ='base', timeout = '8000'},
          --{lib = 'amb@world_human_gardener_plant@male@base', anim ='base', timeout = '8000'},
         -- {lib = 'amb@world_human_gardener_plant@male@base', anim ='base', timeout = '8000'},
         -- {lib = 'amb@world_human_gardener_plant@male@base', anim ='base', timeout = '8000'},
          {lib = 'amb@world_human_gardener_plant@male@idle_a', anim ='idle_a', timeout = '5000'},
          {lib = 'amb@world_human_gardener_plant@male@exit', anim ='exit', timeout = '4000'},
        },
        grow = {
         2.00
        },
        questions = {
            {
                title = 'Miksowanie skladnikow',
                steps = {
                    {label = 'Podziel porcje i zapakuj', value = 1, min = 10, max = 10},
                    {label = 'Dodaj wiecej wypelniaczy i sprobuj szczescia', value = 1, min = 1, max = 20},
                },
                correct = 1
            },
        },
      },
  
        ['seed_aloes'] = {
              object = 'prop_weed_01',
              end_object = 'prop_weed_02',
              fail_msg = 'Roślina zwiędła!',
              success_msg = 'Zebrano uprawy!',
              start_msg = 'Sadzenie rośliny...',
              success_item = 'aloes_pooch',
              first_step = 1.70,
              steps = 1,
              cords = {
                --{x = 2226.7, y = 5576.78, z = 53.95, distance = 10.25},
                --{x = -126.95, y = 2792.93, z = 53.11, distance = 10.25},
                {distance = 10.25},   
                --{x = 1198.05, y = -215.25, z = 55, distance = 20.25},
                --{x = 706.05, y = 1269.25, z = 358, distance = 10.25},
               --{x = -709.11, y = -858.77, z = 23.23, distance = 10.25},
                --{x = 1540.85, y = 6335.87, z = 24, distance = 10.25},
               -- {x = 530.74, y = 3093.65, z = 40, distance = 10.25},
               -- {x = -1493.47, y = 4406.66, z = 21.88, distance = 10.25},
              },
              animations_end = {
                {lib = 'amb@world_human_gardener_plant@male@enter', anim ='enter', timeout = '3500'},
                {lib = 'amb@world_human_gardener_plant@male@exit', anim ='exit', timeout = '4500'},
              },
              animations_step = {
                {lib = 'amb@world_human_gardener_plant@male@enter', anim = 'enter', timeout = '3500'},
                {lib = 'amb@world_human_gardener_plant@male@base', anim ='base', timeout = '8000'},
                {lib = 'amb@world_human_gardener_plant@male@base', anim ='base', timeout = '8000'},
                {lib = 'amb@world_human_gardener_plant@male@base', anim ='base', timeout = '8000'},
                {lib = 'amb@world_human_gardener_plant@male@base', anim ='base', timeout = '8000'},
                {lib = 'amb@world_human_gardener_plant@male@base', anim ='base', timeout = '8000'},
                {lib = 'amb@world_human_gardener_plant@male@idle_a', anim ='idle_a', timeout = '9000'},
                {lib = 'amb@world_human_gardener_plant@male@exit', anim ='exit', timeout = '4500'},
              },
              grow = {
                1.00
              },
              questions = {
                  {
                      title = 'Uprawa rośliny',
                      steps = {
                          {label = 'Pielęgnuj i zbierz', value = 1, min = 5, max = 5},
                      },
                      correct = 1
                  },
              },
            },
            ['kwaslizegrowy'] = {
              object = 'bkr_prop_coke_table01a',
              end_object = 'bkr_prop_meth_hcacid',
              fail_msg = 'Cos poszlo nie tak, towar przepadl!',
              success_msg = 'Towar zapakowany!',
              start_msg = 'Rozstawianie sprzetu do pracy...',
              success_item = 'acid',
              first_step = 1.70,
              steps = 1,
              cords = {
                {distance = 10.25},  
                  --{x = -360.1054, y = -430.0021, z = 23.34, distance = 10.25},
                    },
              animations_end = {
                  {lib = 'amb@world_human_gardener_plant@male@enter', anim ='enter', timeout = '3500'},
                  {lib = 'amb@world_human_gardener_plant@male@exit', anim ='exit', timeout = '4500'},
              },
              animations_step = {
                  {lib = 'amb@world_human_gardener_plant@male@enter', anim = 'enter', timeout = '3500'},
                  {lib = 'amb@world_human_gardener_plant@male@base', anim ='base', timeout = '8000'},
                  {lib = 'amb@world_human_gardener_plant@male@base', anim ='base', timeout = '8000'},
                  {lib = 'amb@world_human_gardener_plant@male@base', anim ='base', timeout = '8000'},
                  {lib = 'amb@world_human_gardener_plant@male@base', anim ='base', timeout = '8000'},
                  {lib = 'amb@world_human_gardener_plant@male@base', anim ='base', timeout = '8000'},
                  {lib = 'amb@world_human_gardener_plant@male@idle_a', anim ='idle_a', timeout = '9000'},
                  {lib = 'amb@world_human_gardener_plant@male@exit', anim ='exit', timeout = '4500'},
              },
              grow = {
               1.00
              },
              questions = {
                  {
                      title = 'Miksowanie skladnikow',
                      steps = {
                          {label = 'Podziel porcje i zapakuj', value = 1, min = 10, max = 10},
                          {label = 'Dodaj wiecej wypelniaczy i sprobuj szczescia', value = 1, min = 1, max = 20},
                      },
                      correct = 1
                  },
              },
            },
      -- EKSTAZY
            ['resztki'] = {
              object = 'bkr_prop_coke_table01a',
              end_object = 'bkr_prop_meth_hcacid',
              fail_msg = 'Cos poszlo nie tak, towar przepadl!',
              success_msg = 'Towar zapakowany!',
              start_msg = 'Rozstawianie sprzetu do pracy...',
              success_item = 'extazy',
              first_step = 1.70,
              steps = 1,
              cords = {
                {distance = 10.25},  
                  --{x = -360.1054, y = -430.0021, z = 23.34, distance = 10.25},
                    },
              animations_end = {
                  {lib = 'amb@world_human_gardener_plant@male@enter', anim ='enter', timeout = '3500'},
                  {lib = 'amb@world_human_gardener_plant@male@exit', anim ='exit', timeout = '4500'},
              },
              animations_step = {
                {lib = 'amb@world_human_gardener_plant@male@enter', anim = 'enter', timeout = '4000'},
                {lib = 'amb@world_human_gardener_plant@male@base', anim ='base', timeout = '5000'},
               -- {lib = 'amb@world_human_gardener_plant@male@base', anim ='base', timeout = '8000'},
                --{lib = 'amb@world_human_gardener_plant@male@base', anim ='base', timeout = '8000'},
               -- {lib = 'amb@world_human_gardener_plant@male@base', anim ='base', timeout = '8000'},
               -- {lib = 'amb@world_human_gardener_plant@male@base', anim ='base', timeout = '8000'},
                {lib = 'amb@world_human_gardener_plant@male@idle_a', anim ='idle_a', timeout = '5000'},
                {lib = 'amb@world_human_gardener_plant@male@exit', anim ='exit', timeout = '4000'},
              },
              grow = {
               2.00
              },
              questions = {
                  {
                      title = 'Miksowanie skladnikow',
                      steps = {
                          {label = 'Podziel porcje i zapakuj', value = 1, min = 10, max = 10},
                          {label = 'Dodaj wiecej wypelniaczy i sprobuj szczescia', value = 1, min = 1, max = 20},
                      },
                      correct = 1
                  },
              },
            },

            
    ['seed_sativa'] = {
        object = 'prop_weed_01',
        end_object = 'prop_weed_02',
        fail_msg = 'Roślina zwiędła!',
        success_msg = 'Zebrano uprawy!',
        start_msg = 'Sadzenie rośliny...',
        success_item = 'sativa',
        first_step = 1.70,
        steps = 1,
        cords = {
          --{x = -427.05, y = 1575.25, z = 357, distance = 20.25},
		      {distance = 10.25},  
          --{x = 1198.05, y = -215.25, z = 55, distance = 20.25},
          --{x = 706.05, y = 1269.25, z = 358, distance = 10.25},
          --{x = 1344.05, y = 4387.25, z = 44, distance = 10.25},
          --{x = 1540.85, y = 6335.87, z = 24, distance = 10.25},
          --{x = 530.74, y = 3093.65, z = 40, distance = 10.25},
          --{x = -1493.47, y = 4406.66, z = 21.88, distance = 10.25},
        },
        animations_end = {
          {lib = 'amb@world_human_gardener_plant@male@enter', anim ='enter', timeout = '3500'},
          {lib = 'amb@world_human_gardener_plant@male@exit', anim ='exit', timeout = '4500'},
        },
        animations_step = {
          {lib = 'amb@world_human_gardener_plant@male@enter', anim = 'enter', timeout = '3500'},
          {lib = 'amb@world_human_gardener_plant@male@base', anim ='base', timeout = '8000'},
          {lib = 'amb@world_human_gardener_plant@male@base', anim ='base', timeout = '8000'},
          {lib = 'amb@world_human_gardener_plant@male@base', anim ='base', timeout = '8000'},
          {lib = 'amb@world_human_gardener_plant@male@base', anim ='base', timeout = '8000'},
          {lib = 'amb@world_human_gardener_plant@male@base', anim ='base', timeout = '8000'},
          {lib = 'amb@world_human_gardener_plant@male@idle_a', anim ='idle_a', timeout = '9000'},
          {lib = 'amb@world_human_gardener_plant@male@exit', anim ='exit', timeout = '4500'},
        },
        grow = {
          1.00
        },
        questions = {
            {
                title = 'Uprawa rośliny',
                steps = {
                    {label = 'Pielęgnuj i zbierz', value = 1, min = 5, max = 5},
                },
                correct = 1
            },
        },
      },
    
    
    ['seed_hybrid'] = {
        object = 'prop_weed_01',
        end_object = 'prop_weed_02',
        fail_msg = 'Roślina zwiędła!',
        success_msg = 'Zebrano uprawy!',
        start_msg = 'Sadzenie rośliny...',
        success_item = 'hybrid',
        first_step = 1.70,
        steps = 1,
        cords = {
          --{x = -427.05, y = 1575.25, z = 357, distance = 20.25},
		      {distance = 10.25},  
          --{x = 1198.05, y = -215.25, z = 55, distance = 20.25},
          --{x = 706.05, y = 1269.25, z = 358, distance = 10.25},
          --{x = 1344.05, y = 4387.25, z = 44, distance = 10.25},
          --{x = 1540.85, y = 6335.87, z = 24, distance = 10.25},
          --{x = 530.74, y = 3093.65, z = 40, distance = 10.25},
          --{x = -1493.47, y = 4406.66, z = 21.88, distance = 10.25},
        },
        animations_end = {
          {lib = 'amb@world_human_gardener_plant@male@enter', anim ='enter', timeout = '3500'},
          {lib = 'amb@world_human_gardener_plant@male@exit', anim ='exit', timeout = '4500'},
        },
        animations_step = {
          {lib = 'amb@world_human_gardener_plant@male@enter', anim = 'enter', timeout = '3500'},
          {lib = 'amb@world_human_gardener_plant@male@base', anim ='base', timeout = '8000'},
          {lib = 'amb@world_human_gardener_plant@male@base', anim ='base', timeout = '8000'},
          {lib = 'amb@world_human_gardener_plant@male@base', anim ='base', timeout = '8000'},
          {lib = 'amb@world_human_gardener_plant@male@base', anim ='base', timeout = '8000'},
          {lib = 'amb@world_human_gardener_plant@male@base', anim ='base', timeout = '8000'},
          {lib = 'amb@world_human_gardener_plant@male@idle_a', anim ='idle_a', timeout = '9000'},
          {lib = 'amb@world_human_gardener_plant@male@exit', anim ='exit', timeout = '4500'},
        },
        grow = {
          1.00
        },
        questions = {
            {
                title = 'Uprawa rośliny',
                steps = {
                    {label = 'Pielęgnuj i zbierz', value = 1, min = 5, max = 5},
                },
                correct = 1
            },
        },
      },
    
    
      ['seed_coke100'] = {
        object = 'prop_weed_01',
        end_object = 'prop_cs_leaf',
        fail_msg = 'Roślina zwiędła!',
        success_msg = 'Zebrano uprawy!',
        start_msg = 'Sadzenie rośliny...',
        success_item = 'cokes100',
        first_step = 1.70,
        steps = 1,
        cords = {
          {distance = 10.25},
        },
        animations_end = {
          {lib = 'amb@world_human_gardener_plant@male@enter', anim ='enter', timeout = '4000'},
          {lib = 'amb@world_human_gardener_plant@male@exit', anim ='exit', timeout = '4000'},
        },
        animations_step = {
           {lib = 'amb@world_human_gardener_plant@male@enter', anim = 'enter', timeout = '4000'},
          {lib = 'amb@world_human_gardener_plant@male@base', anim ='base', timeout = '5000'},
         -- {lib = 'amb@world_human_gardener_plant@male@base', anim ='base', timeout = '8000'},
          --{lib = 'amb@world_human_gardener_plant@male@base', anim ='base', timeout = '8000'},
         -- {lib = 'amb@world_human_gardener_plant@male@base', anim ='base', timeout = '8000'},
         -- {lib = 'amb@world_human_gardener_plant@male@base', anim ='base', timeout = '8000'},
          {lib = 'amb@world_human_gardener_plant@male@idle_a', anim ='idle_a', timeout = '5000'},
          {lib = 'amb@world_human_gardener_plant@male@exit', anim ='exit', timeout = '4000'},
        },
        grow = {
          1.00
        },
        questions = {
            {
                title = 'Uprawa rośliny',
                steps = {
                    {label = 'Podlej', value = 1, min = 5, max = 5},
                },
                correct = 1
            },
          
        },
      },
    
    
    ['seed_coke30'] = {
        object = 'prop_weed_01',
        end_object = 'prop_weed_02',
        fail_msg = 'Roślina zwiędła!',
        success_msg = 'Zebrano uprawy!',
        start_msg = 'Sadzenie rośliny...',
        success_item = 'coke30',
        first_step = 1.70,
        steps = 1,
        cords = {
          --{x = -427.05, y = 1575.25, z = 357, distance = 20.25},
		      {distance = 10.25}, 
          --{x = 1198.05, y = -215.25, z = 55, distance = 20.25},
          --{x = 706.05, y = 1269.25, z = 358, distance = 10.25},
          --{x = 1344.05, y = 4387.25, z = 44, distance = 10.25},
          --{x = 1540.85, y = 6335.87, z = 24, distance = 10.25},
          --{x = 530.74, y = 3093.65, z = 40, distance = 10.25},
          --{x = -1493.47, y = 4406.66, z = 21.88, distance = 10.25},
        },
        animations_end = {
          {lib = 'amb@world_human_gardener_plant@male@enter', anim ='enter', timeout = '3500'},
          {lib = 'amb@world_human_gardener_plant@male@exit', anim ='exit', timeout = '4500'},
        },
        animations_step = {
          {lib = 'amb@world_human_gardener_plant@male@enter', anim = 'enter', timeout = '3500'},
          {lib = 'amb@world_human_gardener_plant@male@base', anim ='base', timeout = '8000'},
          {lib = 'amb@world_human_gardener_plant@male@base', anim ='base', timeout = '8000'},
          {lib = 'amb@world_human_gardener_plant@male@base', anim ='base', timeout = '8000'},
          {lib = 'amb@world_human_gardener_plant@male@base', anim ='base', timeout = '8000'},
          {lib = 'amb@world_human_gardener_plant@male@base', anim ='base', timeout = '8000'},
          {lib = 'amb@world_human_gardener_plant@male@idle_a', anim ='idle_a', timeout = '9000'},
          {lib = 'amb@world_human_gardener_plant@male@exit', anim ='exit', timeout = '4500'},
    },
        grow = {
          1.00
        },
        questions = {
            {
                title = 'Uprawa rośliny',
                steps = {
                    {label = 'Pielęgnuj i zbierz', value = 1, min = 5, max = 5},
                },
                correct = 1
            },
        },
      },
    
    
      
    ['seed_coke70'] = {
        object = 'prop_weed_01',
        end_object = 'prop_weed_02',
        fail_msg = 'Roślina zwiędła!',
        success_msg = 'Zebrano uprawy!',
        start_msg = 'Sadzenie rośliny...',
        success_item = 'coke70',
        first_step = 1.70,
        steps = 1,
        cords = {
          --{x = -186.349, y = 2460.2570, z = 196.564, distance = 10.25},
		      {distance = 10.25}, 
          --{x = 706.05, y = 1269.25, z = 358, distance = 10.25},
          --{x = 1344.05, y = 4387.25, z = 44, distance = 10.25},
          --{x = 1540.85, y = 6335.87, z = 24, distance = 10.25},
          --{x = 530.74, y = 3093.65, z = 40, distance = 10.25},
          --{x = -1493.47, y = 4406.66, z = 21.88, distance = 10.25},
        },
        animations_end = {
          {lib = 'amb@world_human_gardener_plant@male@enter', anim ='enter', timeout = '3500'},
          {lib = 'amb@world_human_gardener_plant@male@exit', anim ='exit', timeout = '4500'},
        },
        animations_step = {
          {lib = 'amb@world_human_gardener_plant@male@enter', anim = 'enter', timeout = '3500'},
          {lib = 'amb@world_human_gardener_plant@male@base', anim ='base', timeout = '8000'},
          {lib = 'amb@world_human_gardener_plant@male@base', anim ='base', timeout = '8000'},
          {lib = 'amb@world_human_gardener_plant@male@base', anim ='base', timeout = '8000'},
          {lib = 'amb@world_human_gardener_plant@male@base', anim ='base', timeout = '8000'},
          {lib = 'amb@world_human_gardener_plant@male@base', anim ='base', timeout = '8000'},
          {lib = 'amb@world_human_gardener_plant@male@idle_a', anim ='idle_a', timeout = '9000'},
          {lib = 'amb@world_human_gardener_plant@male@exit', anim ='exit', timeout = '4500'},
        },
        grow = {
          1.00
        },
        questions = {
            {
                title = 'Uprawa rośliny',
                steps = {
                    {label = 'Pielęgnuj i zbierz', value = 1, min = 5, max = 5},
                },
                correct = 1
            },
        },
      },
}
