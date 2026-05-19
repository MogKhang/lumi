import os
import glob
from PIL import Image

lumi_path = 'assets/lumi.png'
base_icon = Image.open(lumi_path).convert("RGBA")

assets_dir = 'tvos/Runner/Assets.xcassets/AppIcon.brandassets'
png_files = glob.glob(f'{assets_dir}/**/*.png', recursive=True)

bg_color = (13, 13, 13, 255)

for png_path in png_files:
    filename = os.path.basename(png_path).lower()
    
    with Image.open(png_path) as original:
        width, height = original.size
        
        # Calculate how big we want the lumi logo to be (e.g. 60% of the height or width depending on aspect ratio to fit safely).
        # App Icons are rectangular 5:3, Top Shelf is wide. We scale by height.
        if "top-shelf" in filename:
            # Top shelf is very wide, let's just make the icon 80% of height
            target_h = int(height * 0.8)
        else:
            # App icons: let's make the logo 75% of height
            target_h = int(height * 0.75)
            
        target_w = target_h # Since lumi is 1600x1600
        
        icon_resized = base_icon.resize((target_w, target_h), Image.Resampling.LANCZOS)
        
        # Determine background
        if "front" in filename:
            # Transparent background
            new_img = Image.new("RGBA", (width, height), (0, 0, 0, 0))
            # Paste the icon in the center
            offset = ((width - target_w) // 2, (height - target_h) // 2)
            new_img.paste(icon_resized, offset, icon_resized)
            new_img.save(png_path)
            
        elif "back" in filename:
            # Solid background, no logo (the logo is on the front layer)
            new_img = Image.new("RGBA", (width, height), bg_color)
            # Apple prefers no alpha in background layer
            new_img = new_img.convert("RGB")
            new_img.save(png_path)
            
        elif "middle" in filename:
            # Empty transparent layer
            new_img = Image.new("RGBA", (width, height), (0, 0, 0, 0))
            new_img.save(png_path)
            
        elif "top-shelf" in filename:
            # Top shelf uses a flat image. Solid background + logo in center.
            new_img = Image.new("RGBA", (width, height), bg_color)
            # Paste logo
            offset = ((width - target_w) // 2, (height - target_h) // 2)
            new_img.paste(icon_resized, offset, icon_resized)
            # Convert to RGB to avoid alpha issues
            new_img = new_img.convert("RGB")
            new_img.save(png_path)
            
print("Successfully generated tvOS icons.")
