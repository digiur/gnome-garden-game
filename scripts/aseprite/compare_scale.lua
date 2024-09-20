-- Setup Dialog Box
local dlg = Dialog()

for i,s in ipairs(app.sprites) do
    dlg:check{  id=s.filename,
                text=app.fs.fileTitle(s.filename) }
end

dlg:button{ id="horizontal", text="Horizontal" }
dlg:button{ id="vertical", text="Vertical" }
dlg:button{ id="cancel", text="Cancel" }

dlg:show()

-- if confirm, do
local data = dlg.data
if data.vertical then

    -- Create new sprite3
    local w = 0
    local h = 0
    for i,s in ipairs(app.sprites) do
        if data[s.filename] then
            w = math.max(w,s.width)
            h = h + s.height
        end
    end
    local myNewSprite = Sprite(w,h)

    -- stack sprites
    local y = 0
    for i,s in ipairs(app.sprites) do
        if s ~= myNewSprite and data[s.filename] then
            local spriteName = app.fs.fileTitle(s.filename)
            for j,l in ipairs(s.layers) do
                -- add layer
                local myNewLayer = myNewSprite:newLayer{
                    name=string.format("%s - %s", spriteName, l.name)
                }
                -- add cells
                for k,c in ipairs(l.cels) do
                    myNewSprite:newCel(myNewLayer, k, c.image, c.position.x, c.position.y + y)
                end
            end
            -- increase y by height
            y = y + s.height
        end
    end
end
-- if confirm, do
local data = dlg.data
if data.horizontal then

    -- Create new sprite3
    local w = 0
    local h = 0
    for i,s in ipairs(app.sprites) do
        if data[s.filename] then
            w = w + s.width
            h = math.max(h,s.height)
        end
    end
    local myNewSprite = Sprite(w,h)

    -- stack sprites
    local x = 0
    for i,s in ipairs(app.sprites) do
        if s ~= myNewSprite and data[s.filename] then
            local spriteName = app.fs.fileTitle(s.filename)
            for j,l in ipairs(s.layers) do
                -- add layer
                local myNewLayer = myNewSprite:newLayer{
                    name=string.format("%s - %s", spriteName, l.name)
                }
                -- add cells
                for k,c in ipairs(l.cels) do
                    myNewSprite:newCel(myNewLayer, k, c.image, c.position.x + x, c.position.y)
                end
            end
            -- increase y by height
            x = x + s.width
        end
    end
end
