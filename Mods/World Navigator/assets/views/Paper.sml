<scrollable layout="content content[200..]">
    <frame layout="768px content[200..]"
            padding="64, 92, 64, 204"
            background={@Mods/pneuma163.WorldNavigator/Sprites/ScrapBackground:ScrapBackground}
            draggable="true" >
        <lane orientation="vertical">
            <lane orientation="vertical">
                <label text={Header} font="dialogue" focusable="true" />
                <spacer layout="0px 96px" />
                <frame *repeat={:Directions}>
                    <label padding="0, 0, 0, 32" font={^DirectionsFont} text={:this} focusable="true" />
                </frame>
            </lane>
            <panel *context={Doodle}>
                <image *if={^HaveDoodle}
                        sprite={Sprite}
                        margin={Offset}
                        scale="4"
                        tint={CurrentColor}
                        opacity="0.7"
                        focusable="true"
                        screen-read={DoodleDescription} />
            </panel>
        </lane>
    </frame>
</scrollable>