local Actor = Actor or require "Lib/actor"
local Enemy = Actor:extend()

local enemyHealthBar = enemyHealthBar or require "Classes/Enemies/enemyHealthBar"

function Enemy:new(image, eSpeed)
  Enemy.super.new(self, image or "Resources/skeletonEnemy.png", 125,25, eSpeed)
  self.forward.x = 0
  self.forward.y = 1
  
  self.health = 300
  
  self.healthBar = enemyHealthBar(self.position, self.health)
end

function Enemy:update(dt)
  Enemy.super.update(self, dt)
  Enemy.move3(self)
  
  self.healthBar.update(self.healthBar, dt, self.position, self.health)
end

function Enemy:draw()
  Enemy.super.draw(self) 
  
 self.healthBar:draw(self.healthBar)
end


function Enemy:move3()
  local fx = math.floor(self.position.x / 50) + 1
  local fy = math.floor(self.position.y / 50) + 1
  
  if(map[fx][fy] == 1) then
    self.delete = true
  end
  
  if self.forward.x == 1 then
    if tonumber(string.format("%.2f",self.position.x / 50)) > math.floor(self.position.x / 50) + 0.51 then
      if map[fx + 1][fy] == 1 then
        if map[fx][fy + 1] == 0 then
          self.rot = self.rot + math.rad(90)
          self.forward.x = 0
          self.forward.y = 1
        elseif map[fx][fy - 1] == 0 then
          self.rot = self.rot + math.rad(-90)
          self.forward.x = 0
          self.forward.y = -1
        end
      end
    end
  elseif self.forward.x == -1 then
    if tonumber(string.format("%.2f",self.position.x / 50)) < math.floor(self.position.x/ 50) + 0.49 then
      if map[fx - 1][fy] == 1 then
        if map[fx][fy + 1] == 0 then
          self.rot = self.rot + math.rad(-90)
          self.forward.x = 0
          self.forward.y = 1
        elseif map[fx][fy - 1] == 0 then
          self.rot = self.rot + math.rad(90)
          self.forward.x = 0
          self.forward.y = -1
        end
      end
    end
  elseif self.forward.y == 1 then
    if tonumber(string.format("%.2f",self.position.y / 50)) > math.floor(self.position.y / 50) + 0.51 then
      if map[fx][fy + 1] == 1 then
        if map[fx + 1][fy] == 0 then
          self.rot = self.rot + math.rad(-90)
          self.forward.x = 1
          self.forward.y = 0
        elseif map[fx - 1][fy] == 0 then
          self.rot = self.rot + math.rad(90)
          self.forward.x = -1
          self.forward.y = 0
        end
      end
    end
  elseif self.forward.y == -1 then
    if tonumber(string.format("%.2f",self.position.y / 50)) < math.floor(self.position.y/ 50) + 0.49 then
      if map[fx][fy - 1] == 1 then
        if map[fx + 1][fy] == 0 then
          self.rot = self.rot + math.rad(90)
          self.forward.x = 1
          self.forward.y = 0
        elseif map[fx - 1][fy] == 0 then
          self.rot = self.rot + math.rad(-90)
          self.forward.x = -1
          self.forward.y = 0
        end
      end
    end
  end
  
   if map[fx][fy] == 3 or map[fx][fy] == 3 and (tonumber(string.format("%.1f",self.position.x / 50)) == math.floor(self.position.x / 50) + 0.5 and (tonumber(string.format("%.1f",self.position.y / 50)) == math.floor(self.position.y / 50) + 0.5)) then
        self.delete = true
   end  
   
   if self.forward.x == 1 or self.forward.x == -1 then
    self.position.y = math.floor(self.position.y / 50) * 50 + 25
  elseif self.forward.y == 1 or self.forward.y == -1 then
    self.position.x = math.floor(self.position.x / 50) * 50 + 25
  end
end


function Enemy:move2()
  local fx = math.floor(self.position.x / 50) + 1
  local fy = math.floor(self.position.y / 50) + 1
  
  print(string.format("%.2f",self.position.x / 50) .. "   " .. string.format("%.2f",self.position.y / 50))
  
  if self.forward.x == 1 or self.forward.x == -1 then
    print(math.floor(self.position.y) + 0.5)
    self.position.y = math.floor(self.position.y) + 0.5
  elseif self.forward.y == 1 or self.forward.y == -1 then
    self.position.x = math.floor(self.position.x) + 0.5
  end

  
  if self.forward.x == 1 then
   --[[ if tonumber(string.format("%.2f",self.position.x / 50)) == math.floor(self.position.x / 50) + 0.50 then
      if map[fx + 1][fy] == 1 then
        if map[fx][fy + 1] == 0 then
          self.forward.x = 0
          self.forward.y = 1
        elseif map[fx][fy - 1] == 0 then
          self.forward.x = 0
          self.forward.y = -1
        end
      end
    else]]if tonumber(string.format("%.2f",self.position.x / 50)) > math.floor(self.position.x / 50) + 0.51 then
      if map[fx + 1][fy] == 1 then
        if map[fx][fy + 1] == 0 then
          self.forward.x = 0
          self.forward.y = 1
        elseif map[fx][fy - 1] == 0 then
          self.forward.x = 0
          self.forward.y = -1
        end
      end
    end
  elseif self.forward.x == -1 then
   --[[ if tonumber(string.format("%.2f",self.position.x / 50)) == math.floor(self.position.x / 50) + 0.50 then
      if map[fx - 1][fy] == 1 then
        if map[fx][fy + 1] == 0 then
          self.forward.x = 0
          self.forward.y = 1
        elseif map[fx][fy - 1] == 0 then
          self.forward.x = 0
          self.forward.y = -1
        end
      end
    else]]if tonumber(string.format("%.2f",self.position.x / 50)) < math.floor(self.position.x/ 50) + 0.49 then
      if map[fx - 1][fy] == 1 then
        if map[fx][fy + 1] == 0 then
          self.forward.x = 0
          self.forward.y = 1
        elseif map[fx][fy - 1] == 0 then
          self.forward.x = 0
          self.forward.y = -1
        end
      end
    end
  elseif self.forward.y == 1 then
    --[[if tonumber(string.format("%.2f",self.position.y / 50)) == math.floor(self.position.y/ 50) + 0.50 then
      if map[fx][fy + 1] == 1 then
        if map[fx + 1][fy] == 0 then
          self.forward.x = 1
          self.forward.y = 0
        elseif map[fx - 1][fy] == 0 then
          self.forward.x = -1
          self.forward.y = 0
        end
      end
    else]]if tonumber(string.format("%.2f",self.position.y / 50)) > math.floor(self.position.y / 50) + 0.51 then
      if map[fx][fy + 1] == 1 then
        if map[fx + 1][fy] == 0 then
          self.forward.x = 1
          self.forward.y = 0
        elseif map[fx - 1][fy] == 0 then
          self.forward.x = -1
          self.forward.y = 0
        end
      end
    end
  elseif self.forward.y == -1 then
    --[[if tonumber(string.format("%.2f",self.position.y / 50)) == math.floor(self.position.y / 50) + 0.50 then
      if map[fx][fy - 1] == 1 then
        if map[fx + 1][fy] == 0 then
          self.forward.x = 1
          self.forward.y = 0
        elseif map[fx - 1][fy] == 0 then
          self.forward.x = -1
          self.forward.y = 0
        end
      end
    else]]if tonumber(string.format("%.2f",self.position.y / 50)) < math.floor(self.position.y/ 50) + 0.49 then
      if map[fx][fy - 1] == 1 then
        if map[fx + 1][fy] == 0 then
          self.forward.x = 1
          self.forward.y = 0
        elseif map[fx - 1][fy] == 0 then
          self.forward.x = -1
          self.forward.y = 0
        end
      end
    end
  end
  
   if map[fx][fy] == 3 or map[fx][fy] == 3 and (tonumber(string.format("%.1f",self.position.x / 50)) == math.floor(self.position.x / 50) + 0.5 and (tonumber(string.format("%.1f",self.position.y / 50)) == math.floor(self.position.y / 50) + 0.5)) then
        self.delete = true
      end
end


function Enemy:move()  
  
  local fx = math.floor(self.position.x / 50) + 1
  local fy = math.floor(self.position.y / 50) + 1
    
    
  if(((tonumber(string.format("%.2f",self.position.y / 50)) > math.floor(self.position.y / 50) + 0.51) or (tonumber(string.format("%.1f",self.position.y / 50)) > math.floor(self.position.y / 50) + 0.5)) and (self.forward.y == 1)) then
   if(not(map[fx][fy + self.forward.y] == 0)) then
      
      if(map[fx+1][fy] == 0) then
        self.forward.y = 0
        self.forward.x = 1
      elseif(map[fx-1][fy] == 0) then
        self.forward.y = 0
        self.forward.x = -1
      end
      
    end
    
    self.position.y = math.floor(self.position.y) + 0.5
      self.position.x = math.floor(self.position.x) + 0.5
  elseif((tonumber(string.format("%.2f",self.position.y / 50)) < math.floor(self.position.y / 50) + 0.49) and (self.forward.y == -1)) then
    if(not(map[fx][fy + self.forward.y] == 0)) then
     

      if(map[fx+1][fy] == 0) then
        self.forward.y = 0
        self.forward.x = 1
      elseif(map[fx-1][fy] == 0) then
        self.forward.y = 0
        self.forward.x = -1
      end
      
       
    end
    self.position.y = math.floor(self.position.y) + 0.5
      self.position.x = math.floor(self.position.x) + 0.5
  elseif((tonumber(string.format("%.2f",self.position.x / 50)) > math.floor(self.position.x / 50) + 0.51) or (tonumber(string.format("%.1f",self.position.x / 50)) > math.floor(self.position.x / 50) + 0.5)) and (self.forward.x == 1) then
    if(not(map[fx + self.forward.x][fy] == 0)) then 
      

      if(map[fx][fy+1] == 0) then
        self.forward.y = 1
        self.forward.x = 0
      elseif(map[fx][fy-1] == 0) then
        self.forward.y = -1
        self.forward.x = 0
      end
     
    end
     
      self.position.x = math.floor(self.position.x) + 0.5
            self.position.y = math.floor(self.position.y) + 0.5
  elseif(tonumber(string.format("%.2f",self.position.x / 50)) < math.floor(self.position.x / 50) + 0.49) and (self.forward.x == -1) then
    if(not(map[fx + self.forward.x][fy] == 0)) then 
    

      if(map[fx][fy+1] == 0) then
        self.forward.y = 1
        self.forward.x = 0
      elseif(map[fx][fy-1] == 0) then
        self.forward.y = -1
        self.forward.x = 0
      end
      
        
    end
    self.position.x = math.floor(self.position.x) + 0.5
      self.position.y = math.floor(self.position.y) + 0.5
  end
  
  
  

      if map[fx][fy] == 3 or map[fx][fy] == 3 and (tonumber(string.format("%.1f",self.position.x / 50)) == math.floor(self.position.x / 50) + 0.5 and (tonumber(string.format("%.1f",self.position.y / 50)) == math.floor(self.position.y / 50) + 0.5)) then
        self.delete = true
      end
  
end


return Enemy