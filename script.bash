echo > ~/.hushlogin
msg="👋 Welcome back, Kabil!"
printf "%*s\n" $(( (${#msg} + $(tput cols)) / 2 )) "$msg"

# Battery status on terminal launch
power_info=$(pmset -g batt)
battery_percent=$(echo "$power_info" | grep -Eo '[0-9]+%' | tr -d '%')
power_source=$(echo "$power_info" | grep "Now drawing from" | sed 's/Now drawin$

# Centered message helper
center_print() {
  msg="$1"
  width=$(tput cols)
  padding=$(( (width + ${#msg}) / 2 ))
  printf "%*s\n" "$padding" "$msg"
}

# Display battery info
center_print " $power_source"

if [ "$battery_percent" -lt 15 ]; then
  center_print "⚠️ Warning: Low Battery ($battery_percent%"
else
  center_print "System ready to build — Battery at $battery_percent%"
fi
