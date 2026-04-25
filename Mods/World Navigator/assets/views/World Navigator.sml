<frame>
    <panel layout="1280px 720px"
            *switch={CurrentSubmenu} 
            horizontal-content-alignment="middle" 
            vertical-content-alignment="middle" 
            click=|~WNMenuViewModel.DismissUINotice()| >
        <errorstate *if={IsError} errortext={ErrorString} />
        <uinotice *if={UINotice} />
        <welcomepanel *case="Welcome" />
        <npcpanel *case="NPC" />
        <questpanel *case="Quest" />
        <searchpanel *case="Search" />
        <eventspanel *case="Events" />
        <optionspanel *case="Options" />
        <integrationspanel *case="Integrations" />
        <processingpanel *case="Processing" />
    </panel>
</frame>

<!-- -------- submenu templates -------- -->

<template name="welcomepanel">
        <panel layout={WelcomeScreenPanelLayout} padding={WelcomeScreenPanelPadding}>
            <lane *float={WelcomeScreenFloatOffset} layout="640px content" orientation="vertical" horizontal-content-alignment="middle">
                <banner layout="content[480..640] content"
                        text={#world_navigator_name}
                        padding="0, 16, 0, 16"
                        background={@Mods/StardewUI/Sprites/BannerBackground} 
                        background-border-thickness="48, 0"
                        focusable={~WNMenuViewModel.FocusMore} />
            </lane>
            <image margin="-16" layout={WelcomeScreenImageLayout} fit="stretch" sprite={@Mods/StardewUI/Sprites/MenuBorder} />
            <frame layout="stretch stretch"
                    margin="16, 16, 32, 32"
                    background={@Mods/StardewUI/Sprites/MenuBackground}>
                <lane layout="stretch stretch" orientation="vertical" horizontal-content-alignment="middle" vertical-content-alignment="middle">
                    <lane orientation="vertical">
                        <lane orientation="horizontal">
                            <button click=|~WNMenuViewModel.SelectSubmenu("NPC")|
                                    layout={WelcomeScreenButtonLayout}
                                    tooltip={#menu_NPC_tooltip}
                                    shadow-visible="true"
                                    default-background={@Mods/StardewUI/Sprites/ButtonDark}
                                    hover-background={@Mods/StardewUI/Sprites/ButtonLight} >
                                <lane orientation="vertical" horizontal-content-alignment="middle" transform="translate: 0, -2"><!-- vertical space of 68px -->
                                    <spacer layout="0px 16px" />
                                    <image layout="content 36px" fit="contain" scale={WelcomeScreenButtonImageScale} sprite={CurrentEmoji} />
                                    <spacer layout="0px 16px" />
                                    <welcomeScreenButtonLabel text={#menu_NPC} />
                                </lane>
                            </button>
                            <spacer layout={WelcomeScreenHorizontalGridSpacerLayout} />
                            <lane orientation="vertical" horizontal-content-alignment="middle">
                                <button click=|~WNMenuViewModel.SelectSubmenu("Quest")|
                                        layout={WelcomeScreenButtonLayout}
                                        tooltip={#menu_quest_tooltip}
                                        shadow-visible="true"
                                        default-background={@Mods/StardewUI/Sprites/ButtonDark}
                                        hover-background={@Mods/StardewUI/Sprites/ButtonLight} >
                                    <lane orientation="vertical" horizontal-content-alignment="middle" transform="translate: 0, -2">
                                        <panel layout="stretch stretch" horizontal-content-alignment="middle" vertical-content-alignment="middle">
                                            <lane *!if={QuestCountIsZero} margin="144, 0, 0, -24" orientation="horizontal">
                                                <image layout="6px 14px" sprite={@Mods/pneuma163.WorldNavigator/Sprites/TinyParen:TinyLeftParen} />
                                                <digits number={QuestCount} />
                                                <image layout="6px 14px" sprite={@Mods/pneuma163.WorldNavigator/Sprites/TinyParen:TinyRightParen} />
                                            </lane>
                                        </panel>
                                        <spacer layout="0px 10px" />
                                        <image layout="content 48px" fit="contain" scale={WelcomeScreenButtonImageScale} sprite={@Mods/pneuma163.WorldNavigator/Sprites/cursors:QuestExclamation} />
                                        <spacer layout="0px 10px" />
                                        <welcomeScreenButtonLabel text={#menu_quest} />
                                    </lane>
                                </button>
                            </lane>
                        </lane>
                        <spacer layout={WelcomeScreenVerticalGridSpacerLayout} />
                        <lane orientation="horizontal">
                            <button click=|~WNMenuViewModel.SelectSubmenu("Search")|
                                    layout={WelcomeScreenButtonLayout}
                                    tooltip={#menu_search_tooltip}
                                    shadow-visible="true"
                                    default-background={@Mods/StardewUI/Sprites/ButtonDark}
                                    hover-background={@Mods/StardewUI/Sprites/ButtonLight} >
                                <lane orientation="vertical" horizontal-content-alignment="middle" transform="translate: 0, -2"><!-- vertical space of 68px -->
                                    <spacer layout="0px 8px" />
                                    <image layout="content 52px" fit="contain" scale={WelcomeScreenButtonImageScale} sprite={@Mods/pneuma163.WorldNavigator/Sprites/cursors:MagnifyingGlass} />
                                    <spacer layout="0px 8px" />
                                    <welcomeScreenButtonLabel text={#menu_search} />
                                </lane>
                            </button>
                            <spacer layout={WelcomeScreenHorizontalGridSpacerLayout} />
                            <lane orientation="vertical" horizontal-content-alignment="middle">
                                <!-- this is why we can't have nice things (i.e. this fake button requires very special attention) -->
                                <panel click=|~WNMenuViewModel.GoHome()|
                                        layout={WelcomeScreenButtonLayout}
                                        horizontal-content-alignment="middle"
                                        tooltip={#menu_go_home_tooltip}
                                        *context={SubmenuGuidanceButtons}>
                                    <panel layout="stretch stretch"
                                                pointer-enter=|SetGuideHover("true")|
                                                pointer-leave=|SetGuideHover("false")|
                                                horizontal-content-alignment="middle">
                                        <panel layout="stretch stretch"
                                                horizontal-content-alignment="middle"
                                                vertical-content-alignment="middle"
                                                focusable={~WNMenuViewModel.NotUINotice}>
                                            <image layout="stretch stretch"
                                                    fit="stretch"
                                                    *!if={HoverGuide}
                                                    sprite={@Mods/StardewUI/Sprites/ButtonDark}
                                                    shadow-alpha="0.5"
                                                    shadow-offset="-4, 4" />
                                            <image layout="stretch stretch"
                                                    fit="stretch"
                                                    *if={HoverGuide}
                                                    sprite={@Mods/StardewUI/Sprites/ButtonLight}
                                                    shadow-alpha="0.5"
                                                    shadow-offset="-4, 4" />
                                            <image layout="64px 64px" 
                                                    *if={HoverGuide}
                                                    transform={^WelcomeScreenGoHomeTransform1} 
                                                    fit="stretch" 
                                                    scale={^WelcomeScreenButtonImageScale}
                                                    sprite={@Mods/pneuma163.WorldNavigator/Sprites/GuideMenu:Pointer}
                                                    z-index="2" />
                                            <image layout="64px 64px" 
                                                    *!if={HoverGuide}
                                                    transform={^WelcomeScreenGoHomeTransform2} 
                                                    fit="stretch" 
                                                    scale={^WelcomeScreenButtonImageScale}
                                                    sprite={@Mods/pneuma163.WorldNavigator/Sprites/GuideMenu:Pointer}
                                                    z-index="2" />
                                            <image layout="128px 64px" 
                                                    transform={^WelcomeScreenGoHomeTransform3} 
                                                    fit="stretch" 
                                                    scale={^WelcomeScreenButtonImageScale}
                                                    sprite={@Mods/pneuma163.WorldNavigator/Sprites/GuideMenu:Arrow}
                                                    z-index="1" />
                                        </panel>
                                        <label font={^WelcomeScreenFont} 
                                                margin={^WelcomeScreenButtonMargin} 
                                                text={#menu_go_home} 
                                                transform={^WelcomeScreenGoHomeTransform4} 
                                                shadow-alpha="0.6"
                                                shadow-color="#952"
                                                shadow-offset={^WelcomeScreenButtonShadowOffset} /><!-- could update template to use welcomeScreenButtonLabel -->
                                    </panel>
                                </panel>
                            </lane>
                        </lane>
                        <spacer layout={WelcomeScreenVerticalGridSpacerLayout} />
                        <lane orientation="horizontal">
                            <button click=|~WNMenuViewModel.SelectSubmenu("Events")|
                                    layout={WelcomeScreenButtonLayout}
                                    tooltip={#menu_go_events_tooltip}
                                    shadow-visible="true"
                                    default-background={@Mods/StardewUI/Sprites/ButtonDark}
                                    hover-background={@Mods/StardewUI/Sprites/ButtonLight} >
                                <lane orientation="vertical" horizontal-content-alignment="middle" transform="translate: 0, -2"><!-- vertical space of 68px -->
                                    <spacer layout="0px 2px" />
                                    <image layout="content 64px" fit="contain" scale={WelcomeScreenButtonImageScale} sprite={@Mods/pneuma163.WorldNavigator/Sprites/emotes:ThreeDots} />
                                    <spacer layout="0px 2px" />
                                    <welcomeScreenButtonLabel text={#menu_go_events} />
                                </lane>
                            </button>
                            <spacer layout={WelcomeScreenHorizontalGridSpacerLayout} />

                            <!-- potential upcoming feature -->
                            <panel click=|~WNMenuViewModel.SelectSubmenu("Unimplemented")|
                                    layout={WelcomeScreenButtonLayout}
                                    horizontal-content-alignment="middle"
                                    tooltip="" >
                                <lane orientation="vertical" horizontal-content-alignment="middle" transform="translate: 0, -2"><!-- vertical space of 68px -->
                                    <spacer layout="0px 2px" />
                                    <image layout="content 94px" fit="contain" scale={WelcomeScreenButtonImageScale} opacity={UnimplementedOpacity} sprite={CurrentUnimplementedTexture} />
                                    <spacer layout="0px 2px" />
                                    <welcomeScreenButtonLabel text="" />
                                </lane>
                            </panel>

                        </lane>
                        <spacer layout={WelcomeScreenVerticalGridSpacerLayout} />
                        <lane orientation="horizontal">
                            <button click=|~WNMenuViewModel.SelectSubmenu("Options")|
                                    layout={WelcomeScreenButtonLayout}
                                    tooltip={#menu_options_tooltip}
                                    shadow-visible="true"
                                    default-background={@Mods/StardewUI/Sprites/ButtonDark}
                                    hover-background={@Mods/StardewUI/Sprites/ButtonLight} >
                                <lane orientation="vertical" horizontal-content-alignment="middle" transform="translate: 0, -2"><!-- vertical space of 68px -->
                                    <spacer layout="0px 2px" />
                                    <image layout="content 64px" fit="contain" scale={WelcomeScreenButtonImageScale} sprite={@Item/(O)79} />
                                    <spacer layout="0px 2px" />
                                    <welcomeScreenButtonLabel text={#menu_options} />
                                </lane>
                            </button>
                            <spacer layout={WelcomeScreenHorizontalGridSpacerLayout} />
                            <lane orientation="vertical" horizontal-content-alignment="middle">
                                <button click=|~WNMenuViewModel.SelectSubmenu("Integrations")|
                                        layout={WelcomeScreenButtonLayout}
                                        tooltip={PointsOfInterestCountTooltip}
                                        shadow-visible="true"
                                        default-background={@Mods/StardewUI/Sprites/ButtonDark}
                                        hover-background={@Mods/StardewUI/Sprites/ButtonLight} >
                                    <lane orientation="vertical" horizontal-content-alignment="middle" transform="translate: 0, -2">
                                        <panel layout="stretch stretch" horizontal-content-alignment="middle" vertical-content-alignment="middle">
                                            <lane *!if={PointsOfInterestCountIsZero} margin="144, 0, 0, -24" orientation="horizontal">
                                                <image layout="6px 14px" sprite={@Mods/pneuma163.WorldNavigator/Sprites/TinyParen:TinyLeftParen} />
                                                <digits number={PointsOfInterestCount} />
                                                <image layout="6px 14px" sprite={@Mods/pneuma163.WorldNavigator/Sprites/TinyParen:TinyRightParen} />
                                            </lane>
                                        </panel>
                                        <spacer layout="0px 2px" />
                                        <image layout="content 64px" fit="contain" scale={WelcomeScreenButtonImageScale} sprite={@Item/(O)102} />
                                        <spacer layout="0px 2px" />
                                        <welcomeScreenButtonLabel text={#menu_poi} />
                                    </lane>
                                </button>
                            </lane>
                        </lane>
                    </lane>
                </lane>
            </frame>
            <frame *float={WelcomeScreenSidePanelFloat} 
                    layout={WelcomeScreenSidePanelLayout}
                    *if={GuidanceIsActiveOrRecentlyWas} 
                    background={@Mods/StardewUI/Sprites/ControlBorder}
                    padding="32">
                <lane orientation="vertical">
                    <button layout={WelcomeScreenSidePanelButtonLayout} 
                            click=|~WNMenuViewModel.EndActiveGuidance()| 
                            tooltip={#menu_end_navigation_button_text_tooltip} 
                            default-background={@Mods/StardewUI/Sprites/ButtonDark}
                            default-background-tint="#c66"
                            hover-background={@Mods/StardewUI/Sprites/ButtonDark}
                            hover-background-tint="#f55"
                            shadow-visible="true"
                            +hover:transform={WelcomeScreenSidePanelButtonHoverTranform}
                            +state:inert={ShouldShowInertButtonsOnSidePanel}
                            +state:inert:transform="scale: 1; translate: 0, 0"
                            +state:inert:default-background-tint="#aa2"
                            +state:inert:hover-background-tint="#aa2"
                            +state:inert:tooltip=""
                            +state:inert:screen-read={:StopInertDescription}>
                        <lane orientation="horizontal" 
                                layout={WelcomeScreenSidePanelButtonLayout} 
                                horizontal-content-alignment="middle" 
                                vertical-content-alignment="middle">
                            <image margin="12" sprite={@Mods/pneuma163.WorldNavigator/Sprites/cursors:Cancel} />
                            <label layout="content content"
                                    font={WelcomeScreenFont} 
                                    text={#menu_end_navigation_button_text}
                                    bold="true"
                                    margin="12" /><!-- notably does not use welcomeScreenButtonLabel -->
                        </lane>
                    </button>
                    <spacer layout="0px 24px" />
                    <button layout={WelcomeScreenSidePanelButtonLayout} 
                            click=|~WNMenuViewModel.Recalculate()| 
                            tooltip={#menu_recalculate_button_text_tooltip}  
                            default-background={@Mods/StardewUI/Sprites/ButtonLight}
                            default-background-tint="#fff"
                            hover-background={@Mods/StardewUI/Sprites/ButtonLight}
                            hover-background-tint="#7d7"
                            shadow-visible="true"
                            +hover:transform={WelcomeScreenSidePanelButtonHoverTranform}
                            +state:inert={ShouldShowInertButtonsOnSidePanel}
                            +state:inert:transform="scale: 1; translate: 0, 0"
                            +state:inert:default-background-tint="#aa2"
                            +state:inert:hover-background-tint="#aa2"
                            +state:inert:tooltip=""
                            +state:inert:screen-read={:RecalculateInertDescription}>
                        <lane orientation="horizontal" 
                                layout={WelcomeScreenSidePanelButtonLayout} 
                                horizontal-content-alignment="middle" 
                                vertical-content-alignment="middle">
                            <image sprite={@Mods/pneuma163.WorldNavigator/Sprites/GuideMenu:Pointer} 
                                    scale="4" 
                                    margin="24, 0, 32, 0"
                                    transform="rotate: 270; translate: 0, 16" /><!-- margin is to account for the effect of scale -->
                            <welcomeScreenButtonLabel text={#menu_recalculate_button_text} />
                        </lane>
                    </button>
                    <spacer layout="0px 32px" />
                    <label *!if={ShouldShowInertButtonsOnSidePanel} 
                            font={WelcomeScreenFont} 
                            text={CurrentGuidanceDescription}
                            focusable={~WNMenuViewModel.FocusMore} />
                </lane>
            </frame>
        </panel>
</template>

<template name="welcomeScreenButtonLabel">
                                        <label font={WelcomeScreenFont} 
                                                margin={WelcomeScreenButtonMargin} 
                                                text={&text}
                                                shadow-alpha="0.6"
                                                shadow-color="#973"
                                                shadow-offset={WelcomeScreenButtonShadowOffset} />
</template>

<template name="npcpanel">
        <panel layout="1280px 720px">
            <image margin="-16" layout="1312px 752px" fit="stretch" sprite={@Mods/StardewUI/Sprites/MenuBorder} />
            <frame layout="stretch stretch"
                    margin="16"
                    padding="32"
                    background={@Mods/StardewUI/Sprites/MenuBackground}>
                <npcpanelGrid />
            </frame>
        </panel>
</template>

<template name="npcpanelGrid">
                <lane layout="stretch stretch" orientation="vertical">
                    <lane *!if={AnNPCIsSelected} layout="stretch content" orientation="horizontal">
                        <npcpanelHeader />
                    </lane>
                    <!-- The upper portion of an NPC's single page view -->
                    <lane *if={AnNPCIsSelected} *context={NPCToGuideTo} orientation="horizontal" vertical-content-alignment="middle">
                        <button *if={^AnNPCIsSelected} click=|~WNMenuViewModel.ResetNPCSelections()|>
                            <lane orientation="horizontal">
                                <image layout="56px 56px" 
                                        sprite={@Mods/pneuma163.WorldNavigator/Sprites/cursors:LeftArrow} 
                                        tint="#ddd" />
                                <spacer layout="32px 0px" />
                                <label margin="0, 4, 0, 0" 
                                        font="dialogue" 
                                        text={#menu_npc_go_to_list}
                                        screen-read={#menu_npc_go_to_list}
                                        focusable={~WNMenuViewModel.NotUINotice} />
                            </lane>
                        </button>
                        <spacer layout="160px 0px" />
                        <image *if={NeedToSocialize}
                                layout="44px 48px" 
                                tooltip={SocializeForQuest} 
                                focusable={~WNMenuViewModel.NotUINotice}
                                sprite={@Mods/pneuma163.WorldNavigator/Sprites/cursors:QuestExclamation} />
                        <spacer layout="20px 0px" />
                        <label *if={NeedToSocialize} 
                                font="small" 
                                text={SocializeForQuest} />
                    </lane>
                    <image layout="stretch 6px" 
                            fit="stretch"
                            margin="8"
                            tint={:~WNMenuViewModel.GenericHorizontalDividerColor}
                            sprite={@Mods/StardewUI/Sprites/GenericHorizontalDivider} />
                    <panel layout="1100px 540px">
                        <!-- Display a grid of NPCs in small rectangles -->
                        <scrollable *!if={AnNPCIsSelected} layout="1100px 540px" peeking="108">
                            <lane orientation="vertical">
                                <label *if={ShowPleaseFilterMessage} layout="stretch content" margin="0, 0, 0, 16" text={PleaseFilterMessage} />
                                <grid *!if={ShowPleaseFilterMessage} layout="stretch content" item-layout="count: 5" horizontal-item-alignment="middle" vertical-item-alignment="middle">
                                    <interactiveNPCList npclist={:AvailableNPCs} />
                                </grid>
                                <grid *if={ShowPleaseFilterMessage} layout="stretch content" item-layout="count: 5" horizontal-item-alignment="middle" vertical-item-alignment="middle">
                                    <interactiveNPCList npclist={:FavoriteNPCs} />
                                </grid>
                            </lane>
                        </scrollable>
                        <lane *!if={AnNPCIsSelected} z-index="-1" orientation="vertical">
                            <spacer layout="0px stretch" />
                            <label text={:NPCShowAllReminder} *if={ShowNPCShowAllReminder} />
                        </lane>
                        <!-- Display a single NPC on a page -->
                        <lane *if={AnNPCIsSelected} orientation="vertical">
                            <scrollable layout="1080px 540px" peeking="108">
                                <lane orientation="vertical" *context={NPCToGuideTo}>
                                    <lane orientation="horizontal" layout="1120px content">
                                        <spacer layout="32px 0px" />
                                        <panel>
                                            <image layout="222px 222px" sprite={@Mods/pneuma163.WorldNavigator/Sprites/cursors:DialogueBox} margin="35, 38, 0, 0"/>
                                            <image layout="192px 192px" 
                                                    sprite={Portrait} 
                                                    margin="50, 54, 15, 15" 
                                                    focusable={~WNMenuViewModel.FocusMore}
                                                    screen-read={PortraitText} />
                                        </panel>
                                        <spacer layout="96px 0px" />
                                        <lane orientation="vertical" layout="694px content">
                                            <spacer layout="0px 32px" />
                                            <label layout="stretch content"
                                                    font="dialogue" 
                                                    text={ScheduleInformation}
                                                    focusable={~WNMenuViewModel.NotUINotice} />
                                        </lane>
                                    </lane>
                                    <label font="dialogue" text={GuidanceInfoText} margin="35, 32, 0, 32" focusable={~WNMenuViewModel.NotUINotice} />
                                    <lane orientation="horizontal">
                                        <lane *if={NotCurrentlyBehindLockedDoorWarpThatWillNotOpenLater} orientation="vertical">
                                            <label layout="540px content" 
                                                    text={CurrentLocationDisplay}
                                                    max-lines="1"
                                                    font="dialogue"
                                                    bold="true"
                                                    focusable={~WNMenuViewModel.NotUINotice} />
                                            <spacer layout="0px 16px" />
                                            <lane orientation="horizontal">
                                                <frame layout="200px 160px" *context={GuidanceButtonsCurrent}>
                                                    <panel layout="200px 160px" 
                                                            click=|~WNMenuViewModel.PrepareGraphAndBeginGuidanceForNPCCurrentLocation(^^NPCToGuideTo)|
                                                            pointer-enter=|SetGuideHover("true")|
                                                            pointer-leave=|SetGuideHover("false")|
                                                            horizontal-content-alignment="middle"
                                                            vertical-content-alignment="middle"
                                                            focusable={~WNMenuViewModel.NotUINotice}>
                                                        <guidebutton hovertext={^GuideButtonTooltipCurrent} />
                                                    </panel>
                                                </frame>
                                                <spacer layout="32px 0px" />
                                                <frame layout="160px 160px" *context={GuidanceButtonsCurrent}>
                                                    <panel layout="160px 160px"
                                                            click=|~WNMenuViewModel.PrepareGraphAndBeginGuidanceForNPCCurrentLocation(^^NPCToGuideTo, "true")|
                                                            pointer-enter=|SetScrapHover("true")|
                                                            pointer-leave=|SetScrapHover("false")|
                                                            horizontal-content-alignment="middle"
                                                            vertical-content-alignment="middle"
                                                            focusable={~WNMenuViewModel.NotUINotice}>
                                                        <scrapbutton hovertext={^ScrapButtonTooltipCurrent} />
                                                    </panel>
                                                </frame>
                                            </lane>
                                        </lane>
                                        <lane *if={GotUsefulScheduleInfo} orientation="vertical">
                                            <label layout="540px content" 
                                                    text={NextLocationDisplay}
                                                    max-lines="1"
                                                    font="dialogue"
                                                    bold="true"
                                                    focusable={~WNMenuViewModel.NotUINotice} />
                                            <spacer layout="0px 16px" />
                                            <lane orientation="horizontal">
                                                <frame layout="200px 160px" *context={GuidanceButtonsNext}>
                                                    <panel layout="200px 160px" 
                                                            click=|~WNMenuViewModel.PrepareGraphAndBeginGuidanceForNPCNextLocation(^^NPCToGuideTo)|
                                                            pointer-enter=|SetGuideHover("true")|
                                                            pointer-leave=|SetGuideHover("false")|
                                                            horizontal-content-alignment="middle"
                                                            vertical-content-alignment="middle"
                                                            focusable={~WNMenuViewModel.NotUINotice}>
                                                        <guidebutton hovertext={^GuideButtonTooltipNext} />
                                                    </panel>
                                                </frame>
                                                <spacer layout="32px 0px" />
                                                <frame layout="160px 160px" *context={GuidanceButtonsNext}>
                                                    <panel layout="160px 160px"
                                                            click=|~WNMenuViewModel.PrepareGraphAndBeginGuidanceForNPCNextLocation(^^NPCToGuideTo, "true")|
                                                            pointer-enter=|SetScrapHover("true")|
                                                            pointer-leave=|SetScrapHover("false")| 
                                                            horizontal-content-alignment="middle"
                                                            vertical-content-alignment="middle"
                                                            focusable={~WNMenuViewModel.NotUINotice}>
                                                        <scrapbutton hovertext={^ScrapButtonTooltipNext} />
                                                    </panel>
                                                </frame>
                                            </lane>
                                        </lane>
                                    </lane>
                                </lane>
                            </scrollable>
                        </lane>
                    </panel>
                </lane>
</template>

<template name="npcpanelHeader">
                        <label font="dialogue" 
                                text={#menu_npc_filter} />
                        <frame layout="320px 60px" right-click=|~WNMenuViewModel.ClearTextInput()|>
                            <textinput layout="320px 60px" text={<>Text} screen-read={#descriptive_filter_name_textbox} />
                        </frame>
                        <spacer layout="64px 0px" />
                        <frame layout="156px 60px" vertical-content-alignment="middle">
                            <checkbox label-text={#menu_npc_az} tooltip={#menu_npc_az_tooltip} is-checked={<>SortNPCAlphabetically} />
                        </frame>
                        <spacer layout="64px 0px" />
                        <frame layout="content 60px" vertical-content-alignment="middle">
                            <checkbox label-text={#menu_npc_all} tooltip={#menu_npc_all_tooltip} is-checked={<>NPCFilterShowAll} />
                        </frame>
</template>

<template name="interactiveNPCList">
                                    <panel *repeat={&npclist}
                                            focusable={~WNMenuViewModel.NotUINotice}
                                            *switch={Hover}
                                            pointer-enter=|SetBackgroundHover("true")|
                                            pointer-leave=|SetBackgroundHover("false")|
                                            click=|~WNMenuViewModel.SelectNPCFromList(this)|
                                            *if={IsNPCNotFiltered}>
                                        <panel horizontal-content-alignment="middle" vertical-content-alignment="middle" z-index="1">
                                            <image layout="220px 240px"
                                                    fit="stretch"
                                                    sprite={@Mods/StardewUI/Sprites/ControlBorder}
                                                    z-index="0"
                                                    tint="#ddd"
                                                    *case="true" />
                                            <image layout="220px 240px"
                                                    fit="stretch"
                                                    sprite={@Mods/StardewUI/Sprites/ControlBorder}
                                                    z-index="0"
                                                    *case="false" />
                                            <lane orientation="vertical" 
                                                    layout="196px 216px" 
                                                    z-index="1" 
                                                    horizontal-content-alignment="middle">
                                                <lane layout="172px 138px"
                                                        orientation="horizontal" 
                                                        padding="24, 20, 20, 8" 
                                                        z-index="1">
                                                    <lane layout="content 120px" orientation="vertical">
                                                        <spacer layout={NPCHeightSpacerLayout} />
                                                        <spacer layout="0px 6px" />
                                                        <image layout={NPCSpriteLayout} 
                                                                sprite={NPCSprite} 
                                                                focusable={~WNMenuViewModel.NotUINotice} 
                                                                hovered-subject={:theNPC}
                                                                screen-read={DisplayName} />
                                                    </lane>
                                                    <spacer layout="20px 0px" />
                                                    <lane layout="72px 138px" orientation="vertical" horizontal-content-alignment="end">
                                                        <image *if={IsFavorite}
                                                                layout="33px 33px"
                                                                focusable={~WNMenuViewModel.NotUINotice}
                                                                tooltip={RemoveFromFavorites}
                                                                screen-read={RemoveFromFavorites}
                                                                sprite={@Mods/pneuma163.WorldNavigator/Sprites/cursors_1_6:FilledStar}
                                                                click=|~WNMenuViewModel.ToggleNPCAsFavorite(Name)| />
                                                        <image *!if={IsFavorite}
                                                                layout="33px 33px"
                                                                focusable={~WNMenuViewModel.NotUINotice}
                                                                tooltip={AddToFavorites}
                                                                screen-read={AddToFavorites}
                                                                sprite={@Mods/pneuma163.WorldNavigator/Sprites/cursors_1_6:EmptyStar}
                                                                click=|~WNMenuViewModel.ToggleNPCAsFavorite(Name)| />
                                                        <lane *if={IsNPCOnSocialList} orientation="horizontal">
                                                            <label text={FriendshipHearts} layout="33px 21px" horizontal-alignment="end" />
                                                            <spacer layout="4px 0px" />
                                                            <image layout="21px 21px" 
                                                                    padding="0, 4, 0, 0" 
                                                                    sprite={@Mods/pneuma163.WorldNavigator/Sprites/cursors:FilledHeart}
                                                                    focusable={~WNMenuViewModel.FocusMore}
                                                                    screen-read={HeartLevel} />
                                                        </lane>
                                                        <spacer layout="0px 6px" />
                                                        <lane *if={IsNPCOnSocialList} orientation="horizontal">
                                                            <image *!if={CanBeGiftedToday}
                                                                    opacity="0.2" 
                                                                    layout="36px 33px" 
                                                                    sprite={@Mods/pneuma163.WorldNavigator/Sprites/cursors2:GiftIcon}
                                                                    focusable={~WNMenuViewModel.FocusMore} />
                                                            <image *if={CanBeGiftedToday}
                                                                    layout="36px 33px" 
                                                                    tooltip={CanBeGiftedTooltip}
                                                                    sprite={@Mods/pneuma163.WorldNavigator/Sprites/cursors2:GiftIcon}
                                                                    focusable={~WNMenuViewModel.FocusMore} />
                                                        </lane>
                                                        <spacer layout="0px 2px" />
                                                        <lane *if={IsNPCOnSocialList} orientation="horizontal">
                                                            <image *if={NeedToSocialize}
                                                                    layout="33px 36px" 
                                                                    tooltip={SocializeForQuest} 
                                                                    sprite={@Mods/pneuma163.WorldNavigator/Sprites/cursors:QuestExclamation}
                                                                    focusable={~WNMenuViewModel.FocusMore} />
                                                            <spacer *if={NeedToSocialize} layout="2px 0px" />
                                                            <image *if={TalkedToToday} 
                                                                    opacity="0.2" 
                                                                    layout="36px 33px" 
                                                                    sprite={@Mods/pneuma163.WorldNavigator/Sprites/cursors2:TalkedIcon}
                                                                    focusable={~WNMenuViewModel.FocusMore} />
                                                            <image *!if={TalkedToToday} 
                                                                    layout="36px 33px" 
                                                                    tooltip={NotTalkedToTooltip}
                                                                    sprite={@Mods/pneuma163.WorldNavigator/Sprites/cursors2:TalkedIcon}
                                                                    focusable={~WNMenuViewModel.FocusMore} />
                                                        </lane>
                                                    </lane>
                                                </lane>
                                                <label layout="content content" 
                                                        font="small"
                                                        text={DisplayName}
                                                        max-lines="1" />
                                            </lane>
                                        </panel>
                                    </panel>
</template>

<template name="questpanel">
        <panel layout="1280px 720px">
            <image margin="-16" layout="1312px 752px" fit="stretch" sprite={@Mods/StardewUI/Sprites/MenuBorder} />
            <frame layout="stretch stretch"
                    margin="16"
                    padding="32"
                    background={@Mods/StardewUI/Sprites/MenuBackground}>
                <lane orientation="vertical">
                    <panel layout="1184px content" horizontal-content-alignment="middle">
                        <banner text={#menu_select_quest_header} 
                                padding="16"
                                background={@Mods/StardewUI/Sprites/BannerBackground} 
                                background-border-thickness="48, 0"
                                focusable={~WNMenuViewModel.FocusMore} />
                    </panel>
                    <spacer layout="0px 32px" />
                    <lane orientation="horizontal">
                        <scrollable layout="760px content" peeking="144">
                            <lane layout="stretch content" orientation="vertical">
                                <panel *repeat={:CurrentQuests} 
                                        layout="stretch content" 
                                        pointer-enter=|SetBackgroundHover("true")|
                                        pointer-leave=|SetBackgroundHover("false")|
                                        click=|~WNMenuViewModel.SelectQuestFromList(this)|
                                        button-press=|~WNMenuViewModel.LookupQuest(this, $Button)|
                                        padding={ItemOffset}>
                                    <image layout="stretch stretch" 
                                            fit="stretch" 
                                            sprite={@Mods/pneuma163.WorldNavigator/Sprites/cursors:QuestRectangle}/>
                                    <lane layout="680px content" orientation="vertical" padding="24">
                                        <banner text={QuestName} focusable={~WNMenuViewModel.NotUINotice} screen-read={QuestNameExpander} />
                                        <image layout="stretch 6px" 
                                                fit="stretch"
                                                margin="8"
                                                tint={:~WNMenuViewModel.GenericHorizontalDividerColor}
                                                sprite={@Mods/StardewUI/Sprites/GenericHorizontalDivider}
                                                *if={Selected} />
                                        <lane orientation="horizontal" *if={Selected}>
                                            <image layout="32px 32px" sprite={@Mods/pneuma163.WorldNavigator/Sprites/cursors:QuestExclamation} />
                                            <spacer layout="16px 0px" />
                                            <label text={QuestDescriptionForNav} font="dialogue" focusable={~WNMenuViewModel.FocusMore} />
                                        </lane>
                                    </lane>
                                </panel>
                                <label *!if={QuestsExist} font="dialogue" text={#menu_quest_no_quests} />
                            </lane>
                        </scrollable>
                        <spacer layout="stretch 0px" />
                        <lane orientation="vertical" horizontal-content-alignment="middle">
                            <lane *if={AnyApplicableQuestSelected} orientation="vertical">
                                <frame layout="200px 160px" *context={SubmenuGuidanceButtons}>
                                    <panel layout="200px 160px"
                                            click=|~WNMenuViewModel.PrepareGraphAndBeginGuidance()|
                                            pointer-enter=|SetGuideHover("true")|
                                            pointer-leave=|SetGuideHover("false")|
                                            horizontal-content-alignment="middle"
                                            vertical-content-alignment="middle"
                                            focusable={~WNMenuViewModel.NotUINotice}>
                                        <guidebutton hovertext={^GuideButtonTooltip} />
                                    </panel>
                                </frame>
                                <spacer layout="0px 32px" />
                                <frame layout="200px 160px" *context={SubmenuGuidanceButtons}>
                                    <panel layout="200px 160px"
                                            click=|~WNMenuViewModel.PrepareGraphAndBeginGuidance("true")|
                                            pointer-enter=|SetScrapHover("true")|
                                            pointer-leave=|SetScrapHover("false")| 
                                            horizontal-content-alignment="middle"
                                            vertical-content-alignment="middle"
                                            focusable={~WNMenuViewModel.NotUINotice}>
                                        <scrapbutton hovertext={^ScrapButtonTooltip} />
                                    </panel>
                                </frame>
                            </lane>
                        </lane>
                        <spacer layout="64px 0px" />
                    </lane>
                </lane>
            </frame>
        </panel>
</template>

<template name="searchpanel">
        <panel layout="1280px 720px">
            <image margin="-16" layout="1312px 752px" fit="stretch" sprite={@Mods/StardewUI/Sprites/MenuBorder} />
            <frame layout="stretch stretch"
                    margin="16"
                    padding="32"
                    background={@Mods/StardewUI/Sprites/MenuBackground}>
                <lane layout="stretch stretch"
                        orientation="vertical">
                    <lane layout="stretch content"
                            orientation="horizontal">
                        <lane layout="stretch content"
                                orientation="vertical">
                            <lane layout="stretch content"
                                    orientation="horizontal">
                                <label font="dialogue" 
                                        text={#menu_to} />
                                <frame layout="540px 60px" right-click=|~WNMenuViewModel.ClearTextInput()|>
                                    <textinput layout="540px 60px" text={<>Text} screen-read={LocationSearchTextInput} />
                                </frame>
                                <button click=|~WNMenuViewModel.SearchButtonClick(Text)|
                                        layout="128px 60px"
                                        tooltip={#menu_search_for_location_tooltip}
                                        screen-read={#menu_search_for_location_tooltip} >
                                    <image layout="32px 32px"
                                            sprite={@Mods/pneuma163.WorldNavigator/Sprites/cursors:MagnifyingGlass} />
                                </button>
                            </lane>
                        </lane>
                    </lane>
                    <image layout="stretch 6px" 
                            fit="stretch"
                            margin="8"
                            tint={:~WNMenuViewModel.GenericHorizontalDividerColor}
                            sprite={@Mods/StardewUI/Sprites/GenericHorizontalDivider} />
                    <frame layout="stretch stretch">
                        <lane layout="stretch content"
                                orientation="horizontal"
                                *switch={DisplayItem} >
                            <lane layout="740px content"
                                    orientation="vertical" >
                                <lane *if={SearchResultsExist} layout="640px 72px" orientation="horizontal">
                                    <grid layout="stretch content" item-layout="count: 3" horizontal-item-alignment="middle">
                                        <frame *repeat={:DisplayItemButtons}>
                                            <lane orientation="horizontal" *switch={Selected}>
                                                <image *case="true" padding="8, 16, 8, 0" sprite={@Mods/StardewUI/Sprites/CaretRight} />
                                                <spacer *case="false" layout="40px 0px" />
                                                <panel layout="128px 64px"
                                                        focusable={~WNMenuViewModel.NotUINotice}
                                                        horizontal-content-alignment="middle"
                                                        vertical-content-alignment="middle"
                                                        click=|~WNMenuViewModel.SetDisplayItem(DisplayItem, ^ResultName)| >
                                                    <image layout="stretch stretch"
                                                            fit="stretch"
                                                            sprite={@Mods/StardewUI/Sprites/ButtonDark}/>
                                                    <image layout="48px 48px"
                                                            sprite={Icon} z-index="1"
                                                            tooltip={ToolTipText}
                                                            screen-read={ToolTipText} />
                                                </panel>
                                            </lane>
                                        </frame>
                                    </grid>
                                </lane>
                                <frame *case="Nothing">
                                    <lane orientation="vertical">
                                        <label font="dialogue" text={WaitingText} focusable={~WNMenuViewModel.FocusMore} />
                                        <spacer *if={GuidanceIsActive} layout="0px 32px" />
                                    </lane>
                                </frame>
                                <scrollable *case="Results" layout="640px 460px" peeking="196">
                                    <lane orientation="vertical">
                                        <frame *if={NoResults}>
                                            <label font="dialogue" text={#menu_no_results} focusable={~WNMenuViewModel.FocusMore} />
                                        </frame>
                                        <frame *repeat={:Results} *switch={Hover}>
                                            <panel layout="stretch content"
                                                    pointer-enter=|SetBackgroundHover("true")|
                                                    pointer-leave=|SetBackgroundHover("false")|
                                                    click=|~WNMenuViewModel.SetDisplayItem("Directions", Name)|
                                                    padding={ItemOffset} >
                                                <image layout="stretch stretch"
                                                        fit="stretch"
                                                        sprite={@Mods/StardewUI/Sprites/MenuSlotOutset}
                                                        tint="#ddd" 
                                                        *case="false" />
                                                <image layout="stretch stretch"
                                                        fit="stretch"
                                                        sprite={@Mods/StardewUI/Sprites/MenuSlotInset}
                                                        *case="true" />
                                                <label font="dialogue" 
                                                        layout="content" 
                                                        padding="8"
                                                        text={DisplayName}
                                                        screen-read={DisplayNameDescription}
                                                        focusable={~WNMenuViewModel.NotUINotice}
                                                        max-lines="1" />
                                                <label font="small"
                                                        layout="content"
                                                        margin="16, 56, 0, 16"
                                                        text={ParenName} 
                                                        screen-read={ParenNameDescription}
                                                        *if={ShowInternalNames}
                                                        max-lines="1" />
                                            </panel>
                                        </frame>
                                    </lane>
                                </scrollable>
                                <frame *case="MapGrid" *context={MapGrid}>
                                    <lane layout="stretch stretch" orientation="vertical">
                                        <label font="dialogue" text={DisplayName} max-lines="1"/>
                                        <spacer layout="0px 16px" />
                                        <panel layout="700px 404px">
                                            <image layout="stretch stretch"
                                                    fit="contain"
                                                    sprite={Texture}
                                                    focusable={~WNMenuViewModel.FocusMore}
                                                    click=|~WNMenuViewModel.MapWasClicked($Position)|
                                                    screen-read={MapGridImageDescription} />
                                            <frame *if={^SpecificTile}>
                                                <image scale={^MarkerScale} 
                                                        padding={^MarkerOffset}
                                                        sprite={@Mods/pneuma163.WorldNavigator/Sprites/GreenCheck:GreenCheck} />
                                            </frame>
                                        </panel>
                                    </lane>
                                </frame>
                                <frame *case="Directions">
                                    <scrollable layout="640px content" peeking="108">
                                        <lane layout="content content" orientation="vertical">
                                            <label padding="0, 8, 0, 8" font="dialogue" text={ResultDisplayName} focusable={~WNMenuViewModel.FocusMore} />
                                            <image layout="stretch 6px" 
                                                    fit="stretch"
                                                    margin="0, 8, 0, 8"
                                                    tint={:~WNMenuViewModel.GenericHorizontalDividerColor}
                                                    sprite={@Mods/StardewUI/Sprites/GenericHorizontalDivider} />
                                            <frame *repeat={:CurrentRoute}>
                                                <label padding="0, 0, 0, 16" font="small" text={:this} focusable={~WNMenuViewModel.FocusMore} />
                                            </frame>
                                        </lane>
                                    </scrollable>
                                </frame>
                                <frame *case="Secret" layout="stretch stretch" *context={SecretGrid}>
                                    <lane layout="stretch stretch" orientation="vertical">
                                        <label font="dialogue" text={DisplayName} focusable={~WNMenuViewModel.FocusMore} />
                                        <spacer layout="0px 16px" />
                                        <image layout="700px 404px" 
                                                fit="contain" 
                                                sprite={Texture} 
                                                focusable={~WNMenuViewModel.FocusMore} 
                                                screen-read={#descriptive_secret_image_partial_description} />
                                    </lane>
                                </frame>
                                <frame *case="Processing"><!-- this is purely visual: the game is temporarily frozen while this is visible -->
                                    <lane layout="content content" orientation="vertical">
                                        <spacer layout="0px 16px" />
                                        <label font="dialogue" text={#menu_may_take_seconds} />
                                        <spacer layout="0px 16px" />
                                        <label font="dialogue" text={DisplayItemProcessingNotice} />
                                    </lane>
                                </frame>
                            </lane>
                            <spacer layout="40px 0px" />
                            <controlpanel *case="MapGrid" />
                            <controlpanel *case="Directions" />
                        </lane>
                    </frame>
                </lane>
            </frame>
        </panel>
</template>

<template name="eventspanel">
        <panel layout="1280px 720px">
            <image margin="-16" layout="1312px 752px" fit="stretch" sprite={@Mods/StardewUI/Sprites/MenuBorder} />
            <frame layout="stretch stretch"
                    margin="16"
                    padding="32"
                    background={@Mods/StardewUI/Sprites/MenuBackground}>
                <lane orientation="vertical">
                    <lane orientation="horizontal" layout="1184px content" horizontal-content-alignment="middle" vertical-content-alignment="middle">
                        <banner text={#menu_events_title} 
                                padding="16"
                                background={@Mods/StardewUI/Sprites/BannerBackground} 
                                background-border-thickness="48, 0"
                                focusable={~WNMenuViewModel.FocusMore} />
                        <spacer layout="64px 0px" />
                        <label text={#menu_events_filter} font="dialogue" />
                        <frame layout="220px 60px" right-click=|~WNMenuViewModel.ClearEventFilterStringInput()|>
                            <textinput layout="220px 60px" 
                                    text={<>EventFilterString} 
                                    tooltip={#menu_events_filter_tooltip}
                                    text-color={EventFilterColor} 
                                    max-length="16" />
                        </frame>
                        <spacer layout="60px 0px" />
                        <lane orientation="horizontal" 
                                tooltip={#menu_events_include_soon_events_tooltip} 
                                vertical-content-alignment="middle"
                                click=|~WNMenuViewModel.ToggleIncludeSoonEventsOnly()| >
                            <image layout="40px 60px" sprite={@Mods/pneuma163.WorldNavigator/Sprites/cursors:Hourglass} />
                            <spacer layout="24px 0px" />
                            <checkbox is-checked={<>IncludeSoonEventsOnly} /><!-- change binding? -->
                        </lane>
                    </lane>
                    <spacer layout="0px 32px" />
                    <lane orientation="horizontal">
                        <scrollable layout="760px content" peeking="144">
                            <lane layout="stretch content" orientation="vertical">
                                <panel *repeat={:EventsForToday} 
                                        *if={ShouldIncludeInMenu}
                                        layout="stretch content" 
                                        click=|~WNMenuViewModel.SelectEventFromList(this)|
                                        button-press=|~WNMenuViewModel.LookupEvent(this, $Button)|>
                                    <image layout="stretch stretch" 
                                            fit="stretch" 
                                            sprite={@Mods/StardewUI/Sprites/ControlBorder}
                                            tint={Tint} />
                                    <lane layout="680px content" orientation="vertical" padding="24">
                                        <label text={LocationDisplayName} 
                                                font="dialogue" 
                                                max-lines="1" 
                                                focusable={~WNMenuViewModel.NotUINotice}
                                                screen-read={SelectEventDescription} />
                                        <image layout="stretch 6px" 
                                                fit="stretch"
                                                margin="0, 8, 0, 8"
                                                tint={:~WNMenuViewModel.GenericHorizontalDividerColor}
                                                sprite={@Mods/StardewUI/Sprites/GenericHorizontalDivider} />
                                        <lane orientation="horizontal">
                                            <label *if={HasTimeCondition} text={TimeConditionForEvent} focusable={~WNMenuViewModel.FocusMore} />
                                            <panel *if={HasTimeCondition}>
                                                <image *if={PassedTimeConditions} 
                                                        layout="27px 24px"
                                                        padding="12, 0, 12, 0"
                                                        sprite={@Mods/pneuma163.WorldNavigator/Sprites/cursors_1_6:Checkmark}
                                                        focusable={~WNMenuViewModel.FocusMore}
                                                        screen-read={#descriptive_time_condition_passed} />
                                                <image *!if={PassedTimeConditions} 
                                                        layout="28px 30px"
                                                        padding="12, 0, 12, 0"
                                                        sprite={@Mods/pneuma163.WorldNavigator/Sprites/cursors:RedX}
                                                        focusable={~WNMenuViewModel.FocusMore}
                                                        screen-read={#descriptive_time_condition_failed} />
                                            </panel>
                                            <image *if={HasNPCAndTimeConditions}
                                                    layout="6px stretch" 
                                                    fit="stretch"
                                                    margin="8, 0, 16, 0"
                                                    tint={:~WNMenuViewModel.GenericHorizontalDividerColor}
                                                    sprite={@Mods/StardewUI/Sprites/ThinVerticalDivider} />
                                            <label *if={HasNPCCondition} text={NPCConditionForEvent} focusable={~WNMenuViewModel.FocusMore} />
                                            <panel *if={HasNPCCondition}>
                                                <image *if={PassedPresentNPCsConditions} 
                                                        layout="27px 24px"
                                                        padding="12, 0, 12, 0"
                                                        sprite={@Mods/pneuma163.WorldNavigator/Sprites/cursors_1_6:Checkmark}
                                                        focusable={~WNMenuViewModel.FocusMore}
                                                        screen-read={#descriptive_npc_condition_passed} />
                                                <image *!if={PassedPresentNPCsConditions} 
                                                        layout="28px 30px"
                                                        padding="12, 0, 12, 0"
                                                        sprite={@Mods/pneuma163.WorldNavigator/Sprites/cursors:RedX}
                                                        focusable={~WNMenuViewModel.FocusMore}
                                                        screen-read={#descriptive_npc_condition_failed} />
                                            </panel>
                                        </lane>
                                    </lane>
                                </panel>
                            </lane>
                        </scrollable>
                        <spacer layout="stretch 0px" />
                        <lane orientation="vertical" horizontal-content-alignment="middle">
                            <lane *if={AnyEventIsSelected} orientation="vertical">
                                <frame layout="200px 160px" *context={SubmenuGuidanceButtons}>
                                    <panel layout="200px 160px"
                                            click=|~WNMenuViewModel.PrepareGraphAndBeginGuidanceForEvent(^EventToGuideTo)|
                                            pointer-enter=|SetGuideHover("true")|
                                            pointer-leave=|SetGuideHover("false")|
                                            horizontal-content-alignment="middle"
                                            vertical-content-alignment="middle"
                                            focusable={~WNMenuViewModel.NotUINotice}>
                                        <guidebutton hovertext={^GuideButtonTooltip} />
                                    </panel>
                                </frame>
                                <spacer layout="0px 32px" />
                                <frame layout="200px 160px" *context={SubmenuGuidanceButtons}>
                                    <panel layout="200px 160px"
                                            click=|~WNMenuViewModel.PrepareGraphAndBeginGuidanceForEvent(^EventToGuideTo, "true")|
                                            pointer-enter=|SetScrapHover("true")|
                                            pointer-leave=|SetScrapHover("false")| 
                                            horizontal-content-alignment="middle"
                                            vertical-content-alignment="middle"
                                            focusable={~WNMenuViewModel.NotUINotice}>
                                        <scrapbutton hovertext={^ScrapButtonTooltip} />
                                    </panel>
                                </frame>
                            </lane>
                        </lane>
                        <spacer layout="64px 0px" />
                    </lane>
                </lane>
            </frame>
        </panel>
</template>

<template name="optionspanel">
        <panel layout="640px 720px">
            <image margin="-16" layout="672px 752px" fit="stretch" sprite={@Mods/StardewUI/Sprites/MenuBorder} />
            <frame layout="stretch stretch"
                    margin="16"
                    padding="32"
                    background={@Mods/StardewUI/Sprites/MenuBackground}>
                <scrollable layout="580px content" peeking="144">
                    <lane layout="stretch content" orientation="vertical">
                        <panel layout="stretch content" horizontal-content-alignment="middle">
                            <banner text={#menu_options_title} margin="0, 0, 30, 0" focusable={~WNMenuViewModel.FocusMore} />
                        </panel>
                        <spacer layout="0px 24px" />
                        <label text={#menu_options_note_save_file} padding="0, 0, 16, 0" focusable={~WNMenuViewModel.FocusMore} />
                        <spacer layout="0px 24px" />
                        <label text={#menu_options_home_location_header} font="dialogue" bold="true" focusable={~WNMenuViewModel.FocusMore} />
                        <spacer layout="0px 24px" />
                        <lane orientation="horizontal" layout="580px content" horizontal-content-alignment="middle">
                            <button click=|~WNMenuViewModel.SetHome()|
                                    layout="208px content[72..]"
                                    tooltip={#menu_options_set_home_location_tooltip}>
                                <label text={#menu_options_set_home_location_button} />
                            </button>
                            <spacer layout="24px 0px" />
                            <button click=|~WNMenuViewModel.ResetHome()|
                                    layout="208px content[72..]"
                                    tooltip={#menu_options_reset_home_location_tooltip}>
                                <label text={#menu_options_reset_home_location_button} />
                            </button>
                            <spacer layout="30px 0px" />
                        </lane>
                        <spacer layout="0px 24px" />
                        <label text={#menu_options_route_header} font="dialogue" bold="true" focusable={~WNMenuViewModel.FocusMore} />
                        <spacer layout="0px 24px" />
                        <lane orientation="horizontal">
                            <label text={#menu_options_pointer_type} />
                            <spacer layout="8px 0px" />
                            <dropdown options={:PointerTypes}
                                    option-format={:PointerTypeFormat}
                                    option-min-width="200"
                                    selected-option={<>PointerType}
                                    screen-read="visual pointer type drop down. option pointer selected" />
                        </lane>
                        <spacer layout="0px 24px" />
                        <lane orientation="horizontal">
                            <checkbox label-text="Show destination indicator:" 
                                    tooltip="Show a visual indicator at the destination or above the NPC" 
                                    is-checked={<>ShowDestinationIndicator} />
                            <image scale="4" padding="24, 12, 0, 0" sprite={@Mods/pneuma163.WorldNavigator/Sprites/cursors:DestinationIndicator} />
                        </lane>
                        <spacer layout="0px 24px" />
                        <checkbox label-text={#menu_options_show_farmhouse_route_notice} 
                                tooltip={#menu_options_show_farmhouse_route_notice_tooltip} 
                                is-checked={<>ShowFarmhouseNotice} />
                        <spacer layout="0px 24px" />
                        <checkbox label-text={#menu_options_use_money} 
                                tooltip={#menu_options_use_money_tooltip}
                                is-checked={<>UseMoneyInRoute} />
                        <spacer *if={:DowntownZuzuIsInstalled} layout="0px 24px" />
                        <checkbox label-text={#menu_options_avoid_zuzu_traffic} 
                                tooltip={#menu_options_avoid_zuzu_traffic_tooltip}
                                is-checked={<>AvoidZuzuTraffic}
                                *if={:DowntownZuzuIsInstalled} />
                        <spacer layout="0px 24px" />
                        <label text={#menu_options_check_restrictions_on} font="dialogue" bold="true" focusable={~WNMenuViewModel.FocusMore} />
                        <spacer layout="0px 12px" />
                        <label text={#menu_options_check_restrictions_description} focusable={~WNMenuViewModel.FocusMore} />
                        <spacer layout="0px 12px" />
                        <checkbox label-text={#menu_options_check_restrictions_money} 
                                tooltip={#menu_options_check_restrictions_money_tooltip} 
                                is-checked={<>CheckMoney} />
                        <spacer layout="0px 12px" />
                        <checkbox label-text={#menu_options_check_restrictions_doors}
                                tooltip={#menu_options_check_restrictions_doors_tooltip}
                                is-checked={<>CheckLockedDoors} />
                        <spacer layout="0px 12px" />
                        <checkbox label-text={#menu_options_check_restrictions_bus_times} 
                                tooltip={#menu_options_check_restrictions_bus_times_tooltip} 
                                is-checked={<>CheckBusTimes} />
                        <spacer layout="0px 24px" />
                        <label text={#menu_options_menu_options_header} font="dialogue" bold="true" focusable={~WNMenuViewModel.FocusMore} />
                        <spacer layout="0px 24px" />
                        <label text={#menu_options_color_walkable} focusable={~WNMenuViewModel.FocusMore} />
                        <lane orientation="horizontal">
                            <color-picker layout="300px content" color={<>WalkableColor} screen-read={#descriptive_set_walkable_color} />
                            <spacer layout="24px 0px" />
                            <button text={#menu_options_reset} click=|~WNMenuViewModel.ResetWalkableColor()| screen-read={#descriptive_reset_walkable_color} />
                        </lane>
                        <spacer layout="0px 24px" />
                        <label text={#menu_options_color_not_walkable} focusable={~WNMenuViewModel.FocusMore} />
                        <lane orientation="horizontal">
                            <color-picker layout="300px content" color={<>NotWalkableColor} screen-read={#descriptive_set_not_walkable_color} />
                            <spacer layout="24px 0px" />
                            <button text={#menu_options_reset} click=|~WNMenuViewModel.ResetNotWalkableColor()| screen-read={#descriptive_reset_not_walkable_color} />
                        </lane>
                        <spacer *if={:ShouldOptimizeNPCMenu} layout="0px 24px" />
                        <label *if={:ShouldOptimizeNPCMenu} text={#menu_options_npc_menu_maximum_count} />
                        <slider *if={:ShouldOptimizeNPCMenu}
                                track-width="300"
                                min="25"
                                max="105"
                                interval="5"
                                tooltip={#menu_options_npc_menu_maximum_count_tooltip}
                                value-format={:NPCMenuMaximumCountFormat}
                                value={<>NPCMenuMaximumCount} />
                        <spacer layout="0px 24px" />
                        <checkbox label-text={#menu_options_sort_npc_alphabetical}
                                tooltip={#menu_options_sort_npc_alphabetical_tooltip}
                                is-checked={<>SortNPCAlphabetically} />
                        <spacer layout="0px 24px" />
                        <label text={#menu_options_keybind_note} padding="0, 0, 16, 0" focusable={~WNMenuViewModel.FocusMore} />
                        <label text={#menu_options_keybind_not_set_note} padding="0, 16, 16, 0" *if={DisplayMenuKeybindAdditionalNote} focusable={~WNMenuViewModel.FocusMore} />
                        <spacer layout="0px 24px" />
                        <label text={#menu_options_keybind_header} font="dialogue" focusable={~WNMenuViewModel.FocusMore} />
                        <spacer layout="0px 24px" />
                        <keybind-editor button-height="64"
                                sprite-map={@Mods/StardewUI/SpriteMaps/Buttons:default-default-0.5}
                                editable-type="MultipleKeybinds"
                                add-button-text={#menu_options_keybind_add}
                                empty-text={#menu_options_keybind_not_set}
                                focusable={~WNMenuViewModel.NotUINotice}
                                keybind-list={<>OpenMenuKeybinds} />
                        <spacer layout="0px 24px" />
                        <label text={#menu_options_keybind_not_set_note} padding="0, 16, 16, 0" *if={DisplayLookupMoreKeybindAdditionalNote} focusable={~WNMenuViewModel.FocusMore} />
                        <label text={#menu_options_keybind_lookup_more} font="dialogue" focusable={~WNMenuViewModel.FocusMore} />
                        <spacer layout="0px 24px" />
                        <keybind-editor button-height="64"
                                sprite-map={@Mods/StardewUI/SpriteMaps/Buttons:default-default-0.5}
                                editable-type="MultipleKeybinds"
                                add-button-text={#menu_options_keybind_add}
                                empty-text={#menu_options_keybind_not_set}
                                focusable={~WNMenuViewModel.NotUINotice}
                                keybind-list={<>LookupMoreKeybinds} />
                        <spacer layout="0px 24px" />
                        <label text={#menu_options_keybind_not_set_note} padding="0, 16, 16, 0" *if={DisplayDescribeGuidanceKeybindAdditionalNote} focusable={~WNMenuViewModel.FocusMore} />
                        <label text={#menu_options_keybind_describe_guidance} font="dialogue" focusable={~WNMenuViewModel.FocusMore} />
                        <spacer layout="0px 24px" />
                        <keybind-editor button-height="64"
                                sprite-map={@Mods/StardewUI/SpriteMaps/Buttons:default-default-0.5}
                                editable-type="MultipleKeybinds"
                                add-button-text={#menu_options_keybind_add}
                                empty-text={#menu_options_keybind_not_set}
                                focusable={~WNMenuViewModel.NotUINotice}
                                keybind-list={<>DescribeGuidanceKeybinds} />
                        <spacer layout="0px 24px" />
                        <checkbox label-text={#gmcm_focus_more} is-checked={<>FocusMore} />
                        <image layout="544px 6px" 
                                fit="stretch"
                                margin="0, 24, 0, 8"
                                tint={:~WNMenuViewModel.GenericHorizontalDividerColor}
                                sprite={@Mods/StardewUI/Sprites/GenericHorizontalDivider}/>
                        <label text={#menu_options_report_bug} focusable={~WNMenuViewModel.FocusMore} />
                    </lane>
                </scrollable>
            </frame>
        </panel>
</template>

<template name="integrationspanel"><!-- points of interest -->
        <panel layout="1280px 720px">
            <image margin="-16" layout="1312px 752px" fit="stretch" sprite={@Mods/StardewUI/Sprites/MenuBorder} />
            <frame layout="stretch stretch"
                    margin="16"
                    padding="32"
                    background={@Mods/StardewUI/Sprites/MenuBackground}>
                <lane layout="stretch stretch" orientation="vertical">
                    <panel layout="stretch content" horizontal-content-alignment="middle">
                        <banner text={#menu_poi_today_points_header} focusable={~WNMenuViewModel.FocusMore} />
                    </panel>
                    <spacer layout="0px 32px" />
                    <lane orientation="horizontal">
                        <scrollable layout="832px 540px" peeking="192">
                            <lane orientation="vertical">
                                <panel layout="832px content" *repeat={:IntegrationCategories}>
                                    <expander layout="stretch content" 
                                            collapsed-sprite={@Mods/pneuma163.WorldNavigator/Sprites/cursors:CaretRight}
                                            is-expanded={<>IsExpanded}>
                                        <panel *outlet="header" layout="768px content" >
                                            <image layout="768px 112px" 
                                                    fit="stretch" 
                                                    sprite={@Mods/StardewUI/Sprites/ControlBorder} />
                                            <image *float="before; 696, 0"
                                                    layout="832px 112px" 
                                                    fit="stretch" 
                                                    sprite={@Mods/StardewUI/Sprites/ControlBorder}
                                                    opacity="0"
                                                    click=|~WNMenuViewModel.ClickedExpander(IsExpanded)| />
                                            <lane orientation="horizontal" 
                                                    layout="content 64px" 
                                                    vertical-content-alignment="middle" 
                                                    padding="24"
                                                    z-index="1">
                                                <panel *!if={GeneratedTexture} layout="64px 64px">
                                                    <image layout="64px 64px" 
                                                            fit="contain" 
                                                            horizontal-alignment="middle" 
                                                            vertical-alignment="middle" 
                                                            sprite={Icon} />
                                                </panel>
                                                <panel *if={GeneratedTexture} layout="64px 64px">
                                                    <image *if={OneWordModName} 
                                                            layout="64px 64px" 
                                                            fit="contain" 
                                                            horizontal-alignment="middle" 
                                                            vertical-alignment="middle" 
                                                            sprite={GeneratedChar1} />
                                                    <image *!if={OneWordModName} 
                                                            layout="64px 64px" 
                                                            margin="16, 16, 0, 0" 
                                                            fit="contain" 
                                                            horizontal-alignment="middle" 
                                                            vertical-alignment="middle" 
                                                            sprite={GeneratedChar2} />
                                                    <image *!if={OneWordModName} 
                                                            layout="64px 64px" 
                                                            margin="0, 0, 16, 16" 
                                                            fit="contain" 
                                                            horizontal-alignment="middle" 
                                                            vertical-alignment="middle" 
                                                            sprite={GeneratedChar1} />
                                                </panel>
                                                <spacer layout="16px 0px" />
                                                <label font="dialogue" text={DisplayName} max-lines="1" screen-read={DisplayNameDescriptionText} />
                                            </lane>
                                        </panel>
                                        <panel>
                                            <lane orientation="vertical">
                                                <panel layout="752px content" 
                                                        *repeat={:PointsOfInterest} 
                                                        click=|~WNMenuViewModel.SelectPOIFromList(this)|
                                                        margin="64, 0, 0, 0">
                                                    <image *if={Selected} 
                                                            tint="#ccc" 
                                                            layout="stretch stretch" 
                                                            fit="stretch" 
                                                            sprite={@Mods/StardewUI/Sprites/MenuSlotOutset} />
                                                    <image *!if={Selected} 
                                                            layout="stretch stretch" 
                                                            fit="stretch" 
                                                            sprite={@Mods/StardewUI/Sprites/MenuSlotOutset} />
                                                    <lane layout="704px content" orientation="vertical" padding="24">
                                                        <label text={PoiDisplayNameString} focusable={~WNMenuViewModel.FocusMore} screen-read={PoiDisplayNameStringDescriptionText} />
                                                        <label text={SectionOfMapString} focusable={~WNMenuViewModel.FocusMore} screen-read={SectionOfMapStringDescriptionText} />
                                                        <image layout="stretch 6px" 
                                                                fit="stretch"
                                                                margin="0, 8, 0, 8"
                                                                tint={:~WNMenuViewModel.GenericHorizontalDividerColor}
                                                                sprite={@Mods/StardewUI/Sprites/GenericHorizontalDivider}
                                                                *if={HasDescription} />
                                                        <label *if={HasDescription} 
                                                                margin="32, 0, 0, 0" 
                                                                text={PoiDescription} 
                                                                focusable={~WNMenuViewModel.NotUINotice}
                                                                screen-read={PoiDescriptionDescriptionText} />
                                                    </lane>
                                                </panel>
                                            </lane>
                                        </panel>
                                    </expander>
                                </panel>
                            </lane>
                        </scrollable>
                        <spacer layout="120px 0px" />
                        <lane orientation="vertical">
                            <lane *if={AnyPoiIsSelected} orientation="vertical">
                                <frame layout="200px 160px" *context={SubmenuGuidanceButtons}>
                                    <panel layout="200px 160px"
                                            click=|~WNMenuViewModel.PrepareGraphAndBeginGuidanceForPOI(^PoiToGuideTo)|
                                            pointer-enter=|SetGuideHover("true")|
                                            pointer-leave=|SetGuideHover("false")|
                                            horizontal-content-alignment="middle"
                                            vertical-content-alignment="middle"
                                            focusable={~WNMenuViewModel.NotUINotice}>
                                        <guidebutton hovertext={^GuideButtonTooltip} />
                                    </panel>
                                </frame>
                                <spacer layout="0px 32px" />
                                <frame layout="200px 160px" *context={SubmenuGuidanceButtons}>
                                    <panel layout="200px 160px"
                                            click=|~WNMenuViewModel.PrepareGraphAndBeginGuidanceForPOI(^PoiToGuideTo, "true")|
                                            pointer-enter=|SetScrapHover("true")|
                                            pointer-leave=|SetScrapHover("false")| 
                                            horizontal-content-alignment="middle"
                                            vertical-content-alignment="middle"
                                            focusable={~WNMenuViewModel.NotUINotice}>
                                        <scrapbutton hovertext={^ScrapButtonTooltip} />
                                    </panel>
                                </frame>
                            </lane>
                        </lane>
                    </lane>
                </lane>
            </frame>
        </panel>
</template>

<template name="processingpanel">
        <panel layout="1280px 720px">
            <image margin="-16" layout="1312px 752px" fit="stretch" sprite={@Mods/StardewUI/Sprites/MenuBorder} />
            <frame layout="stretch stretch"
                    margin="16"
                    padding="32"
                    background={@Mods/StardewUI/Sprites/MenuBackground} 
                    horizontal-content-alignment="middle" vertical-content-alignment="middle">
                <banner text={CurrentProcessingNotice} />
            </frame>
        </panel>
</template>

<!-- -------- small templates -------- -->

<template name="errorstate">
    <frame layout="stretch stretch" 
            z-index="2"
            horizontal-content-alignment="middle"
            vertical-content-alignment="middle">
        <frame layout="400px content"
                padding="32"
                horizontal-content-alignment="middle"
                background={@Mods/StardewUI/Sprites/ControlBorder}
                shadow-alpha="0.5"
                shadow-offset="-8, 8">
            <lane orientation="vertical">
                <label font="dialogue" text={&errortext} focusable="true" screen-read={&errortext} />
            </lane>
        </frame>
    </frame>
</template>

<template name="uinotice">
    <frame layout="stretch stretch" 
            z-index="512"
            horizontal-content-alignment="middle"
            vertical-content-alignment="middle"
            click=|~WNMenuViewModel.DismissUINotice()|>
        <frame layout="600px content"
                padding="32"
                horizontal-content-alignment="middle"
                background={@Mods/StardewUI/Sprites/ControlBorderUncolored}
                background-tint="#fc9f"
                shadow-alpha="0.5"
                shadow-offset="-8, 8">
            <lane layout="stretch content" orientation="vertical">
                <scrollable layout="stretch content" peeking="108">
                    <label font="dialogue" text={UINoticeString} padding="0, 0, 0, 16" focusable="true" />
                </scrollable>
                <image layout="stretch 6px" 
                        fit="stretch"
                        margin="0, 8, 0, 8"
                        tint={:~WNMenuViewModel.GenericHorizontalDividerColor}
                        sprite={@Mods/StardewUI/Sprites/GenericHorizontalDivider} />
                <label text={#menu_click_to_dismiss} focusable="true"/>
            </lane>
        </frame>
    </frame>
</template>

<template name="controlpanel">
    <lane layout="stretch content"
            orientation="vertical">
        <lane orientation="horizontal">
            <frame layout="200px 160px" *context={SubmenuGuidanceButtons}>
                <panel layout="200px 160px"
                        click=|~WNMenuViewModel.BeginGuidanceFromSearch()|
                        pointer-enter=|SetGuideHover("true")|
                        pointer-leave=|SetGuideHover("false")|
                        horizontal-content-alignment="middle"
                        vertical-content-alignment="middle"
                        focusable={~WNMenuViewModel.NotUINotice}>
                    <guidebutton hovertext={^GuideButtonTooltip} />
                </panel>
            </frame>
            <spacer layout="32px 0px" />
            <frame layout="160px 160px" *context={SubmenuGuidanceButtons}>
                <panel layout="160px 160px"
                        click=|~WNMenuViewModel.BeginGuidanceFromSearch("true")|
                        pointer-enter=|SetScrapHover("true")|
                        pointer-leave=|SetScrapHover("false")| 
                        horizontal-content-alignment="middle"
                        vertical-content-alignment="middle"
                        focusable={~WNMenuViewModel.NotUINotice}>
                    <scrapbutton hovertext={^ScrapButtonTooltip} />
                </panel>
            </frame>
        </lane>
        <spacer layout="0px 32px" />
        <checkbox label-text={#menu_specific_tile} is-checked={<>SpecificTile} />
        <spacer *if={SpecificTile}
                layout="0px 48px" />
        <slider *if={SpecificTile}
                track-width="200"
                min="0"
                max={SliderWidth}
                interval="1"
                value-format={:FormatX}
                value={<>TargetX}
                tooltip={#menu_higher_x}
                screen-read={WestEastSliderDescription} />
        <spacer *if={SpecificTile}
                layout="0px 8px" />
        <lane *if={SpecificTile}
                orientation="horizontal">
            <spacer layout="24px 0px" />
            <image layout="44px 40px"
                    fit="contain"
                    sprite={@Mods/pneuma163.WorldNavigator/Sprites/cursors:LeftArrow}
                    click=|~WNMenuViewModel.ChangeTargetX("false")|
                    focusable={~WNMenuViewModel.NotUINotice}
                    screen-read={#descriptive_move_target_west} />
            <spacer layout="60px 0px" />
            <image layout="44px 40px"
                    fit="contain"
                    sprite={@Mods/pneuma163.WorldNavigator/Sprites/cursors:RightArrow}
                    click=|~WNMenuViewModel.ChangeTargetX("true")|
                    focusable={~WNMenuViewModel.NotUINotice}
                    screen-read={#descriptive_move_target_east} />
        </lane>
        <spacer *if={SpecificTile}
                layout="0px 32px" />
        <slider *if={SpecificTile}
                track-width="200"
                min="0"
                max={SliderHeight}
                interval="1"
                value-format={:FormatY}
                value={<>TargetY} 
                tooltip={#menu_higher_y}
                screen-read={NorthSouthSliderDescription} />
        <spacer *if={SpecificTile}
                layout="0px 8px" />
        <lane *if={SpecificTile}
                orientation="horizontal">
            <spacer layout="24px 0px" />
            <image layout="40px 44px"
                    fit="contain"
                    sprite={@Mods/pneuma163.WorldNavigator/Sprites/cursors:UpArrow}
                    click=|~WNMenuViewModel.ChangeTargetY("false")|
                    focusable={~WNMenuViewModel.NotUINotice}
                    screen-read={#descriptive_move_target_north} />
            <spacer layout="64px 0px" />
            <image layout="40px 44px"
                    fit="contain"
                    sprite={@Mods/pneuma163.WorldNavigator/Sprites/cursors:DownArrow}
                    click=|~WNMenuViewModel.ChangeTargetY("true")|
                    focusable={~WNMenuViewModel.NotUINotice}
                    screen-read={#descriptive_move_target_south} />
        </lane>
    </lane>
</template>

<template name="guidebutton">
        <image tooltip={&hovertext} screen-read={&hovertext} layout="stretch stretch"
                fit="stretch"
                sprite={@Mods/StardewUI/Sprites/ButtonDark}/>
        <panel tooltip={&hovertext} screen-read={&hovertext}>
            <image layout="64px 64px" 
                    *if={HoverGuide}
                    transform="translate: 30, 0" 
                    fit="stretch" 
                    sprite={@Mods/pneuma163.WorldNavigator/Sprites/GuideMenu:Pointer}
                    z-index="2" />
            <image layout="64px 64px" 
                    *!if={HoverGuide}
                    transform="translate: -18, 0" 
                    fit="stretch" 
                    sprite={@Mods/pneuma163.WorldNavigator/Sprites/GuideMenu:Pointer}
                    z-index="2" />
            <image layout="128px 64px" 
                    transform="translate: 18, -6" 
                    fit="stretch" 
                    sprite={@Mods/pneuma163.WorldNavigator/Sprites/GuideMenu:Arrow}
                    z-index="1" />
        </panel>
</template>

<template name="scrapbutton">
        <image tooltip={&hovertext} screen-read={&hovertext} layout="stretch stretch"
                fit="stretch"
                sprite={@Mods/StardewUI/Sprites/ButtonDark}/>
        <image tooltip={&hovertext} screen-read={&hovertext} layout="128px 128px" fit="stretch" sprite={@Mods/pneuma163.WorldNavigator/Sprites/ScrapMenu:Blank} />
        <image tooltip={&hovertext} screen-read={&hovertext} *if={HoverScrap} layout="128px 128px" fit="stretch" sprite={@Mods/pneuma163.WorldNavigator/Sprites/ScrapMenu:Writing} />
        <image tooltip={&hovertext} screen-read={&hovertext} *if={HoverScrap} layout="128px 128px" fit="stretch" sprite={@Mods/pneuma163.WorldNavigator/Sprites/ScrapMenu:Quill} />
        <image tooltip={&hovertext} screen-read={&hovertext} *!if={HoverScrap} layout="128px 128px" transform="translate: -32, -16" fit="stretch" sprite={@Mods/pneuma163.WorldNavigator/Sprites/ScrapMenu:Quill} />
</template>